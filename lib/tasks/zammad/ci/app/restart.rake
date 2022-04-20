#DevsQuest, https://devsquest.com/

namespace :devsquest do

  namespace :ci do

    namespace :app do

      desc 'Restarts the application'
      task restart: %i[
        devsquest:ci:app:stop
        devsquest:ci:app:start
      ]
    end
  end
end
