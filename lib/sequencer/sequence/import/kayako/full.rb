#DevsQuest, https://devsquest.com/

class Sequencer
  class Sequence
    module Import
      module Kayako
        class Full < Sequencer::Sequence::Base

          def self.sequence
            [
              'Import::Common::ImportMode::Check',
              'Import::Common::SystemInitDone::Check',
              'Import::Common::ImportJob::DryRun',
              'Import::Kayako::DefaultLanguage',
              'Import::Kayako::IdMap',
              'Import::Kayako::Teams',
              'Import::Kayako::FieldMap',
              'Import::Kayako::OrganizationFields',
              'Import::Kayako::Organizations',
              'Import::Kayako::UserFields',
              'Import::Kayako::Users',
              'Import::Kayako::CaseFields',
              'Import::Kayako::Cases',
              'Import::Kayako::TimeEntries',
              'Import::Common::SystemInitDone::Set',
              'Import::Kayako::ImportSettingsUnset',
              'Import::Common::ImportMode::Unset',
            ]
          end
        end
      end
    end
  end
end
