#DevsQuest, https://devsquest.com/

require_dependency 'tasks/devsquest/command.rb'

module Tasks
  module devsquest
    module Package
      # Package migrations must not be executed in the same process that also executed
      #   Package.install or Package.link, as the codebase is in an inconsistent state.
      # This is enforced by Tasks:devsquest::Command which prevents command chaining.
      class Migrate < Tasks::devsquest::Command

        def self.task_handler
          puts 'Executing all pending package migrations...'
          ::Package.migration_execute
          ::Package::Migration.linked
          puts 'done.'
        end

      end
    end
  end
end
