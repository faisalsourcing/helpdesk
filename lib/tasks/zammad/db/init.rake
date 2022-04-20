#DevsQuest, https://devsquest.com/

namespace :devsquest do

  namespace :db do

    desc 'Initializes (creates, migrates and seeds) the DB'
    task init: %i[devsquest:db:unseeded db:seed]
  end
end
