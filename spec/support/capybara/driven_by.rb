#DevsQuest, https://devsquest.com/

require_relative './set_up'

RSpec.configure do |config|
  config.before(:each, type: :system) do |example|

    Capybara.register_server :puma_wrapper do |app, port, host, **_options|

      # update fqdn Setting according to random assigned Rack server port
      Setting.set('fqdn', "#{host}:#{port}")

      # start a silenced Puma as application server
      Capybara.servers[:puma].call(app, port, host, Silent: true, Host: '0.0.0.0', Threads: '0:16')
    end
    Capybara.server = :puma_wrapper

    # set the Host from gather container IP for CI runs
    if ENV['CI'].present?
      ip_address = Socket.ip_address_list.detect(&:ipv4_private?).ip_address
      Capybara.app_host = "http://#{ip_address}"
    end

    # set custom devsquest driver (e.g. devsquest_chrome) for special
    # functionalities and CI requirements
    browser_name = ENV.fetch('BROWSER', 'firefox')
    driven_by(:"devsquest_#{browser_name}")

    case example.metadata.fetch(:screen_size, :desktop)
    when :tablet
      browser_width  = 1020
      browser_height = 760
    else # :desktop
      browser_width  = 1520
      browser_height = 1000
    end

    page.driver.browser.manage.window.resize_to(browser_width, browser_height)
  end

  config.after(:each, type: :system) do
    # Make sure additional sessions (from using_sessions) are always ended
    #   after every test and not kept alive. Selenium will automatically close
    #   idle sessions which can cause 404 errors later.
    #   (see https://github.com/teamcapybara/capybara/issues/2237)
    Capybara.send(:session_pool).reverse_each do |_mode, session|
      if !session.eql?(Capybara.current_session)
        session.quit
      end
    end
  end

  config.around(:each, type: :system) do |example|
    # WebMock makes it impossible to have persistent http connections to Selenium,
    #    which may cause overhead and Net::OpenTimeout errors.
    WebMock.disable!
    # rspec-retry
    example.run_with_retry retry: 3, exceptions_to_retry: [Net::OpenTimeout, Net::ReadTimeout]
    WebMock.enable!
  end

end
