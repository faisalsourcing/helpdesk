#DevsQuest, https://devsquest.com/

namespace :devsquest do

  namespace :bootstrap do

    desc 'Resets a devsquest and reinitializes it'
    task reset: %i[
      db:drop
      devsquest:db:init
      devsquest:setup:auto_wizard
      devsquest:flush
    ]
  end
end
