#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Zendesk
        module Ticket
          class CustomFields < Sequencer::Unit::Import::Zendesk::Common::CustomFields

            uses :ticket_field_map

            private

            def remote_fields
              custom_fields = resource.custom_fields
              return {} if custom_fields.blank?

              custom_fields.select { |custom_field| ticket_field_map[ custom_field['id'] ].present? }
              .to_h do |custom_field|
                [
                  ticket_field_map[ custom_field['id'] ].to_sym, # remote_name
                  custom_field['value']
                ]
              end
            end
          end
        end
      end
    end
  end
end
