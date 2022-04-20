#DevsQuest, https://devsquest.com/

module RuboCop
  module Cop
    module devsquest
      class ForbidTranslatableMarker < Base
        MSG = <<~ERROR_MESSAGE.freeze
          Don't use __() in devsquest core migrations. Translatable strings should be marked where they are defined, e.g. in the DB seeds.
        ERROR_MESSAGE

        def on_send(node)
          add_offense(node) if node.method_name.eql? :__
        end
      end
    end
  end
end
