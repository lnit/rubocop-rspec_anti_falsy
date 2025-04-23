# frozen_string_literal: true

module RuboCop
  module Cop
    module RSpec
      # @safety
      #   This cop is unsafe because it changes how values are compared.
      #
      # @example
      #   # bad
      #   expect(subject).to be_falsy
      #
      #   # good
      #   expect(subject).to be false
      #
      class AvoidBeFalsy < Base
        MSG = "Use `#be false` instead of `#be_falsy`."

        RESTRICT_ON_SEND = %i[be_falsy].freeze

        # @!method be_falsy?(node)
        def_node_matcher :be_falsy?, <<~PATTERN
          (send nil? :be_falsy ...)
        PATTERN

        # Called on every `send` node (method call) while walking the AST.
        # TODO: remove this method if inspecting `send` nodes is unneeded for your cop.
        # By default, this is aliased to `on_csend` as well to handle method calls
        # with safe navigation, remove the alias if this is unnecessary.
        # If kept, ensure your tests cover safe navigation as well!
        def on_send(node)
          return unless be_falsy?(node)

          add_offense(node)
        end
        alias on_csend on_send
      end
    end
  end
end
