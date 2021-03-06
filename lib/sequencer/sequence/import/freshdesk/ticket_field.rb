#DevsQuest, https://devsquest.com/

class Sequencer
  class Sequence
    module Import
      module Freshdesk
        class TicketField < Sequencer::Sequence::Base

          def self.sequence
            [
              'Common::ModelClass::Ticket',
              'Import::Freshdesk::ObjectAttribute::Skip',
              'Import::Freshdesk::ObjectAttribute::SanitizedName',
              'Import::Freshdesk::ObjectAttribute::Config',
              'Import::Freshdesk::ObjectAttribute::Add',
              'Import::Freshdesk::ObjectAttribute::MigrationExecute',
              'Import::Freshdesk::ObjectAttribute::FieldMap',
            ]
          end
        end
      end
    end
  end
end
