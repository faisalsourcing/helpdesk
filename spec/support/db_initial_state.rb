#DevsQuest, https://devsquest.com/

require_relative './rake'

if !ENV['CI_SKIP_DB_RESET']

  # Reset database to be ready for tests
  Rake::Task['devsquest:db:reset'].execute

  # make sure that all migrations of linked packages are executed
  Package::Migration.linked
end
