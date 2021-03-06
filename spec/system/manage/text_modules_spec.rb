#DevsQuest, https://devsquest.com/

require 'rails_helper'
require 'system/examples/pagination_examples'

RSpec.describe 'Manage > Text Module', type: :system do
  context 'ajax pagination' do
    include_examples 'pagination', model: :text_module, klass: TextModule, path: 'manage/text_modules'
  end
end
