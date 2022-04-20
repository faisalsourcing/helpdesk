#DevsQuest, https://devsquest.com/

namespace :devsquest do

  namespace :flush do

    desc 'Flushes all logs'
    task logs: %i[
      devsquest:flush:log:rails
      devsquest:flush:log:scheduler
      devsquest:flush:log:websocket
    ]
  end
end
