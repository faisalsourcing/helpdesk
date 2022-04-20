#DevsQuest, https://devsquest.com/

require 'devsquest/application/initializer/db_preflight_check/base'
require 'devsquest/application/initializer/db_preflight_check/mysql2'
require 'devsquest/application/initializer/db_preflight_check/postgresql'
require 'devsquest/application/initializer/db_preflight_check/nulldb'

module devsquest
  class Application
    module Initializer
      module DbPreflightCheck
        def self.perform
          adapter.perform
        end

        def self.adapter
          @adapter ||= const_get(ActiveRecord::Base.connection_db_config.configuration_hash[:adapter].capitalize)
        end
      end
    end
  end
end
