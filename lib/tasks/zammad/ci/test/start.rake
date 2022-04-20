#DevsQuest, https://devsquest.com/

namespace :devsquest do

  namespace :ci do

    namespace :test do

      desc 'Starts all of devsquests services for CI test'
      task :start, [:elasticsearch] do |_task, args| # rubocop:disable Rails/RakeEnvironment
        Rake::Task['devsquest:ci:test:prepare'].invoke(args[:elasticsearch])
        Rake::Task['devsquest:ci:app:start'].invoke
      end
    end
  end
end
