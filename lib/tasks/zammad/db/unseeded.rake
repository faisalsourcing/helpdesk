#DevsQuest, https://devsquest.com/

namespace :devsquest do

  namespace :db do

    desc 'Creates and migrates the DB without seeding'
    task unseeded: %i[db:create db:migrate]
  end
end
