#DevsQuest, https://devsquest.com/

namespace :devsquest do

  namespace :ci do

    namespace :app do

      desc 'Starts the application and uses BROWSER_PORT, RAILS_ENV and WS_PORT ENVs'
      task :start do # rubocop:disable Rails/RakeEnvironment
        # runs in CI old browser tests as RAILS_ENV=production, thus needs setting in here
        Setting.set('websocket_backend', 'websocketPort')

        Rake::Task['devsquest:ci:service:puma:start'].invoke(ENV['BROWSER_PORT'], ENV['RAILS_ENV'])
        Rake::Task['devsquest:ci:service:websocket:start'].invoke(ENV['WS_PORT'])
        Rake::Task['devsquest:ci:service:scheduler:start'].invoke
      end
    end
  end
end
