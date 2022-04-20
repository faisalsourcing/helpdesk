#DevsQuest, https://devsquest.com/

class Sequencer
  class Sequence
    extend ::Sequencer::Mixin::PrefixedConstantize

    PREFIX = 'Sequencer::Sequence::'.freeze

    attr_reader :units, :expecting

    def initialize(units:, expecting: [])
      @units     = units
      @expecting = expecting
    end
  end
end
