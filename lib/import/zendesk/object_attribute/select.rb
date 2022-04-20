#DevsQuest, https://devsquest.com/

module Import
  class Zendesk
    module ObjectAttribute
      class Select < Import::Zendesk::ObjectAttribute::Base

        def init_callback(object_attribte)
          @data_option.merge!(
            default: '',
            options: options(object_attribte),
          )
        end

        private

        def data_type(_attribute)
          'select'
        end

        def options(object_attribte)
          result = {}
          object_attribte.custom_field_options.each do |entry|
            result[ entry['value'] ] = entry['name']
          end
          result
        end
      end
    end
  end
end
