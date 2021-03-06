#DevsQuest, https://devsquest.com/

require 'rails_helper'
require 'system/examples/pagination_examples'

RSpec.describe 'Manage > Macro', type: :system do
  context 'ajax pagination' do
    include_examples 'pagination', model: :macro, klass: Macro, path: 'manage/macros'
  end
end
