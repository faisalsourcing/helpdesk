#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Freshdesk
        module TimeEntry
          class Skip < Sequencer::Unit::Base
            uses :time_entry_available
            provides :action

            def process
              return if time_entry_available

              state.provide(:action, :skipped)
            end
          end
        end
      end
    end
  end
end
