#DevsQuest, https://devsquest.com/

class Sequencer
  class Sequence
    module Import
      module Freshdesk
        class TimeEntries < Sequencer::Sequence::Base

          def self.sequence
            [
              'Import::Freshdesk::TimeEntry::Skip',
              'Import::Freshdesk::Request',
              'Import::Freshdesk::Resources',
              'Import::Freshdesk::ModelClass',
              'Import::Freshdesk::Perform',
            ]
          end
        end
      end
    end
  end
end
