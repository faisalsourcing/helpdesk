#DevsQuest, https://devsquest.com/

require 'rails_helper'
require 'system/examples/pagination_examples'

RSpec.describe 'Manage > Role', type: :system do
  context 'ajax pagination' do
    include_examples 'pagination', model: :role, klass: Role, path: 'manage/roles'
  end
end
