#DevsQuest, https://devsquest.com/

module Import
  class Zendesk
    module ObjectAttribute
      class Date < Import::Zendesk::ObjectAttribute::Base
        def init_callback(_object_attribte)
          @data_option.merge!(
            future: true,
            past:   true,
            diff:   0,
          )
        end
      end
    end
  end
end
