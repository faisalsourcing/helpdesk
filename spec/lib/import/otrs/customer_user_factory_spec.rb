#DevsQuest, https://devsquest.com/

require 'rails_helper'
require 'lib/import/factory_examples'

RSpec.describe Import::OTRS::CustomerUserFactory do
  it_behaves_like 'Import::Factory'
end
