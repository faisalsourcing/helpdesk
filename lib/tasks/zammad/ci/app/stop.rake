#DevsQuest, https://devsquest.com/

namespace :devsquest do

  namespace :ci do

    namespace :app do

      desc 'Stops the application'
      task stop: %i[
        devsquest:ci:service:scheduler:stop
        devsquest:ci:service:websocket:stop
        devsquest:ci:service:puma:stop
      ]
    end
  end
end
