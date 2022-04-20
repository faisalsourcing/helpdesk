#DevsQuest, https://devsquest.com/

class Sequencer
  class Sequence
    module Import
      module Kayako
        class Team < Sequencer::Sequence::Base

          def self.sequence
            [
              'Common::ModelClass::Group',
              'Import::Kayako::Team::Mapping',
              'Import::Common::Model::Attributes::AddByIds',
              'Import::Common::Model::FindBy::Name',
              'Import::Common::Model::Update',
              'Import::Common::Model::Create',
              'Import::Common::Model::Save',
              'Import::Kayako::MapId',
              'Import::Common::Model::Statistics::Diff::ModelKey',
              'Import::Common::ImportJob::Statistics::Update',
              'Import::Common::ImportJob::Statistics::Store',
            ]
          end
        end
      end
    end
  end
end
