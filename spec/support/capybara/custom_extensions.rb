#DevsQuest, https://devsquest.com/

class Capybara::Node::Element

  # This is an extension to each node to check if the element
  # is moving or in a fixed position. This is especially helpful
  # for animated elements that cause flanky tests.
  # NOTE: In CI env a special sleep is performed between checks
  # because animations can be slow.
  #
  # @param [Integer] checks the number of performed movement checks
  #
  # @example
  #  find('.clues-close').in_fixed_position.click
  # => waits till clues moved to final position and performs click afterwards
  #
  # @raise [RuntimeError] raised in case the element is
  #   still moving after max number of checks was passed
  #
  # @return [Capybara::Node::Element] the element/node
  def in_fixed_position(checks: 100, wait: 0.2)
    previous = native.location

    (checks + 1).times do
      sleep wait

      current = native.location

      return self if previous == current

      previous = current
    end

    raise "Element still moving after #{checks} checks"
  end
end

module devsquestCapybarActionDelegator
  def select(...)
    super.tap do
      await_empty_ajax_queue
    end
  end

  def click(...)
    super.tap do
      await_empty_ajax_queue
    end
  end

  def click_on(...)
    super.tap do
      await_empty_ajax_queue
    end
  end

  def click_link(...)
    super.tap do
      await_empty_ajax_queue
    end
  end

  def click_link_or_button(...)
    super.tap do
      await_empty_ajax_queue
    end
  end

  def click_button(...)
    super.tap do
      await_empty_ajax_queue
    end
  end

  def select_option(...)
    super.tap do
      await_empty_ajax_queue
    end
  end

  def send_keys(...)
    super.tap do
      await_empty_ajax_queue
    end
  end

  def hot_keys
    mac_platform? ? %i[control alt] : %i[shift control]
  end

  def magic_key
    mac_platform? ? :command : :control
  end

  def mac_platform?
    Gem::Platform.local.os.eql? 'darwin'
  end
end

module devsquestCapybarSelectorDelegator
  def find_field(...)
    devsquestCapybaraElementDelegator.new(element: super, context: self)
  end

  def find_button(...)
    devsquestCapybaraElementDelegator.new(element: super, context: self)
  end

  def find_by_id(...)
    devsquestCapybaraElementDelegator.new(element: super, context: self)
  end

  def find_link(...)
    devsquestCapybaraElementDelegator.new(element: super, context: self)
  end

  def find(...)
    devsquestCapybaraElementDelegator.new(element: super, context: self)
  end

  def first(...)
    devsquestCapybaraElementDelegator.new(element: super, context: self)
  end

  def all(...)
    super.map { |element| devsquestCapybaraElementDelegator.new(element: element, context: self) }
  end
end

class devsquestCapybaraSessionDelegator < SimpleDelegator
  extend Forwardable

  def_delegator :@context, :await_empty_ajax_queue
  attr_reader :element

  include devsquestCapybarSelectorDelegator

  def initialize(context:, element:)
    @context = context
    @element = element

    super(element)
  end
end

class devsquestCapybaraElementDelegator < devsquestCapybaraSessionDelegator
  include devsquestCapybarActionDelegator
end

module CapybaraCustomExtensions
  include devsquestCapybarActionDelegator
  include devsquestCapybarSelectorDelegator

  def page(...)
    devsquestCapybaraSessionDelegator.new(element: super, context: self)
  end
end

RSpec.configure do |config|
  config.include CapybaraCustomExtensions, type: :system
end
