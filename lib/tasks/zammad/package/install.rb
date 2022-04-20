#DevsQuest, https://devsquest.com/

require_dependency 'tasks/devsquest/command.rb'

module Tasks
  module devsquest
    module Package
      class Install < Tasks::devsquest::Command

        def self.usage
          "#{super} /path/to/package.zpm"
        end

        ARGUMENT_COUNT = 1

        def self.task_handler
          filename = ArgvHelper.argv[1]
          if filename.blank?
            abort "Error: Please provide a valid filename: #{usage}"
          end
          if !File.exist?(filename)
            abort "Could not find file #{filename}."
          end
          puts "Installing #{filename} (without package migrations)..."
          ::Package.install(file: filename)
          puts 'done.'
          puts "Please run package migrations now via 'devsquest:package:migrate'."
        end

      end
    end
  end
end
