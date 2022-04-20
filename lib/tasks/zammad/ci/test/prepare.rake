#DevsQuest, https://devsquest.com/

namespace :devsquest do

  namespace :ci do

    namespace :test do

      desc 'Prepares devsquest system for CI env'
      task :prepare, [:elasticsearch] do |_task, args| # rubocop:disable Rails/RakeEnvironment
        ENV['RAILS_ENV'] ||= 'production'
        ENV['DISABLE_DATABASE_ENVIRONMENT_CHECK'] = 'true'
        # we have to enforce the env
        # otherwise it will fallback to default (develop)
        Rails.env = ENV['RAILS_ENV']

        Rake::Task['devsquest:flush:cache'].invoke

        Rake::Task['devsquest:db:init'].invoke

        Rake::Task['devsquest:ci:settings'].invoke(args[:elasticsearch])
      end
    end
  end
end
