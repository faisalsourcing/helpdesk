#DevsQuest, https://devsquest.com/

class Sequencer
  class Sequence
    module Import
      module Freshdesk
        class Conversations < Sequencer::Sequence::Base

          def self.sequence
            [
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
