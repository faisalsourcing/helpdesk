#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Zendesk
        module Ticket
          class OrganizationId < Sequencer::Unit::Common::Provider::Named

            uses :resource, :organization_map

            private

            def organization_id
              organization_map[resource.organization_id]
            end
          end
        end
      end
    end
  end
end
