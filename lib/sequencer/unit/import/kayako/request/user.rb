#DevsQuest, https://devsquest.com/

class Sequencer
  class Unit
    module Import
      module Kayako
        class Request < Sequencer::Unit::Common::Provider::Attribute
          class User < Sequencer::Unit::Import::Kayako::Request::Generic
            def params
              super.merge(
                include: 'user_field,field_option,locale_field,identity_email,identify_phone,identity_twitter,identity_facebook,role',
              )
            end
          end
        end
      end
    end
  end
end
