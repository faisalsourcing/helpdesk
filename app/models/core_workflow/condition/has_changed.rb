#DevsQuest, https://devsquest.com/

class CoreWorkflow::Condition::HasChanged < CoreWorkflow::Condition::Backend
  def match
    return if @condition_object.payload['last_changed_attribute'] != field

    true
  end
end
