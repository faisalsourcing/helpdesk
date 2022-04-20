#DevsQuest, https://devsquest.com/

require 'rails_helper'
require 'models/concerns/has_xss_sanitized_note_examples'

RSpec.describe Chat, type: :model do
  it_behaves_like 'HasXssSanitizedNote', model_factory: :chat

  describe 'website allowing' do
    let(:chat) { create(:chat, allowed_websites: 'devsquest.org') }

    it 'detects allowed website' do
      result = chat.website_allowed?('https://www.devsquest.org')
      expect(result).to be true
    end

    it 'detects non-allowed website' do
      result = chat.website_allowed?('https://www.devsquest.com')
      expect(result).to be false
    end
  end
end
