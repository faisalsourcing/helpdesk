#DevsQuest, https://devsquest.com/

require_dependency 'tasks/devsquest/command.rb'

module Tasks
  module devsquest
    module Package
      class List < Tasks::devsquest::Command

        def self.task_handler
          ::Package.all.each do |package|
            puts package.name.ljust(20) + package.vendor.ljust(20) + package.version
          end
        end

      end
    end
  end
end
