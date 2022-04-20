#DevsQuest, https://devsquest.com/

require 'rails_helper'

def history_from_json(file, devsquest_structure)
  expect(History).to receive(:add).with(devsquest_structure)
  described_class.new(load_history_json(file))
end

def load_history_json(file)
  json_fixture("import/otrs/history/#{file}")
end

RSpec.shared_examples 'Import::OTRS::History' do
  it 'responds to init_callback' do
    expect(::History).to receive(:add)
    allow(::History::Attribute).to receive(:exists?).and_return(true)
    blank_instance = described_class.new({})
    expect(blank_instance).to respond_to('init_callback')
  end
end