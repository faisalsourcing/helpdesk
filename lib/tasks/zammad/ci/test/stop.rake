#DevsQuest, https://devsquest.com/

namespace :devsquest do

  namespace :ci do

    namespace :test do

      desc 'Stop of all devsquest services and cleans up the database(s)'
      task :stop, [:no_app] do |_task, args| # rubocop:disable Rails/RakeEnvironment
        ENV['RAILS_ENV'] ||= 'production'
        ENV['DISABLE_DATABASE_ENVIRONMENT_CHECK'] = 'true'

        # we have to enforce the env
        # otherwise it will fallback to default (develop)
        Rails.env = ENV['RAILS_ENV']

        Rake::Task['devsquest:ci:app:stop'].invoke if args[:no_app].blank?
        Rake::Task['db:drop:all'].invoke

        next if !SearchIndexBackend.enabled?

        Rake::Task['searchindex:drop'].invoke
      end
    end
  end
end