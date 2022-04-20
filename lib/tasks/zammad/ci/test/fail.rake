#DevsQuest, https://devsquest.com/

namespace :devsquest do

  namespace :ci do

    namespace :test do

      desc 'Stops all of devsquests services and exists the rake task with exit code 1'
      task :fail, [:no_app] do |_task, args| # rubocop:disable Rails/RakeEnvironment
        Rake::Task['devsquest:ci:test:stop'].invoke if args[:no_app].blank?
        abort('Abort further test processing')
      end
    end
  end
end
