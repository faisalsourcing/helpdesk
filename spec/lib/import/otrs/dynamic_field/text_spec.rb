#DevsQuest, https://devsquest.com/

require 'rails_helper'
require 'lib/import/otrs/dynamic_field_examples'

RSpec.describe Import::OTRS::DynamicField::Text do
  it_behaves_like 'Import::OTRS::DynamicField'

  it 'imports an OTRS Text DynamicField' do

    devsquest_structure = {
      object:        'Ticket',
      name:          'text_example',
      display:       'Text Example',
      screens:       {
        view: {
          '-all-' => {
            shown: true
          }
        }
      },
      active:        true,
      editable:      true,
      position:      '8',
      created_by_id: 1,
      updated_by_id: 1,
      data_type:     'input',
      data_option:   {
        default:   '',
        type:      'text',
        maxlength: 255,
        null:      true
      }
    }

    dynamic_field_from_json('text/default', devsquest_structure)
  end
end
