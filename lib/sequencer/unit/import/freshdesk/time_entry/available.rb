#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Freshdesk
        module TimeEntry
          class Available < Sequencer::Unit::Common::Provider::Attribute
            extend ::Sequencer::Unit::Import::Freshdesk::Requester

            provides :time_entry_available

            def process
              state.provide(:time_entry_available, time_entry_available)
            end

            private

            def time_entry_available
              response = self.class.perform_request(
                api_path: 'time_entries',
              )

              response.is_a?(Net::HTTPOK)
            rescue => e
              logger.info e
              nil
            end
          end
        end
      end
    end
  end
end
