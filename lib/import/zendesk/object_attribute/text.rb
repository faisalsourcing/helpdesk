#DevsQuest, https://devsquest.com/

module Import
  class Zendesk
    module ObjectAttribute
      class Text < Import::Zendesk::ObjectAttribute::Base

        def init_callback(_object_attribte)
          @data_option.merge!(
            type:      'text',
            maxlength: 255,
          )
        end

        private

        def data_type(_attribute)
          'input'
        end
      end
    end
  end
end
