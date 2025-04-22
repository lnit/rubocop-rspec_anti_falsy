# frozen_string_literal: true

module RuboCop
  module Cop
    module RSpec
      # @safety
      #   This cop is unsafe because it changes how values are compared.
      #
      # @example
      #   # bad
      #   expect(subject).to be_truthy
      #
      #   # good
      #   expect(subject).to be true
      #
      #   # good
      #   expect(subject.nil).to be false
      #
      class AvoidBeTruthy < Base
        MSG = "Use `#be true` instead of `#be_truthy`."

        RESTRICT_ON_SEND = %i[be_truthy].freeze

        # @!method be_truthy?(node)
        def_node_matcher :be_truthy?, <<~PATTERN
          (send nil? :be_truthy ...)
        PATTERN

        # Called on every `send` node (method call) while walking the AST.
        # TODO: remove this method if inspecting `send` nodes is unneeded for your cop.
        # By default, this is aliased to `on_csend` as well to handle method calls
        # with safe navigation, remove the alias if this is unnecessary.
        # If kept, ensure your tests cover safe navigation as well!
        def on_send(node)
          return unless be_truthy?(node)

          add_offense(node)
        end
        alias on_csend on_send
      end
    end
  end
end
