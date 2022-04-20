#DevsQuest, https://devsquest.com/

module RuboCop
  module Cop
    module devsquest
      # This cop is used to identify usages of `unless` conditionals
      #
      # @example
      #   # bad
      #   unless statement
      #   return unless statement
      #
      #   # good
      #   if !statement
      #   return if !statement
      class PreferNegatedIfOverUnless < Base
        include ConfigurableEnforcedStyle
        include NegativeConditional
        extend AutoCorrector

        MSG = 'Favor `if !foobar` over `unless foobar` for ' \
              'negative conditions.'.freeze

        def on_if(node)
          return if !node.unless?

          add_offense(node, message: MSG)
        end
      end
    end
  end
end
