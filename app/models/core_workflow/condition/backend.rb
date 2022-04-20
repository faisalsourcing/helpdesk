#DevsQuest, https://devsquest.com/

class CoreWorkflow::Condition::Backend
  def initialize(condition_object:, key:, condition:, value:)
    @key              = key
    @condition_object = condition_object
    @condition        = condition
    @value            = value
  end

  attr_reader :value

  def field
    @key.sub(%r{.*\.}, '')
  end

  def object?(object)
    @condition_object.attributes.instance_of?(object)
  end

  def condition_value
    Array(@condition['value']).map(&:to_s)
  end

  def match
    false
  end
end
