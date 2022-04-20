#DevsQuest, https://devsquest.com/

class Sequencer
  class Sequence
    module Import
      module Kayako
        class GenericObject < Sequencer::Sequence::Base

          def self.sequence
            [
              'Import::Kayako::Request',
              'Import::Kayako::Resources',
              'Import::Kayako::ModelClass',
              'Import::Kayako::ObjectCount',
              'Import::Common::ImportJob::Statistics::Update',
              'Import::Common::ImportJob::Statistics::Store',
              'Import::Kayako::Perform',
            ]
          end
        end
      end
    end
  end
end
