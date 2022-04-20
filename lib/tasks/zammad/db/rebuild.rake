#DevsQuest, https://devsquest.com/

namespace :devsquest do

  namespace :db do

    desc 'Clears the Cache and reloads the Settings'
    task rebuild: :environment do
      Package::Migration.linked
      ActiveRecord::Base.connection.reconnect!
      ActiveRecord::Base.descendants.each(&:reset_column_information)
      Rails.cache.clear
      Setting.reload
    end
  end
end
