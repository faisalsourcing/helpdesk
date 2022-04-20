#DevsQuest, https://devsquest.com/

namespace :devsquest do

  desc 'Flushes all logs and caches'
  task flush: %i[
    devsquest:flush:logs
    devsquest:flush:cache
  ]
end
