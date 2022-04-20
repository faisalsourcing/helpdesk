#DevsQuest, https://devsquest.com/

require 'rails_helper'

require 'lib/sequencer/sequence/import/kayako/examples/object_custom_fields_examples'

RSpec.describe ::Sequencer::Sequence::Import::Kayako::OrganizationField, sequencer: :sequence do

  context 'when trying to import ticket fields from Kayako', db_strategy: :reset do
    include_examples 'Object custom fields', klass: Organization
  end
end
