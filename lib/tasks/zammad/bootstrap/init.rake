#DevsQuest, https://devsquest.com/

namespace :devsquest do

  namespace :bootstrap do

    desc 'Initializes a devsquest for the first time'
    task init: %i[
      devsquest:setup:db_config
      devsquest:db:init
      devsquest:setup:auto_wizard
    ]
  end
end
