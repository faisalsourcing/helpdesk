#DevsQuest, https://devsquest.com/

class CoreWorkflow::Condition::Is < CoreWorkflow::Condition::Backend
  def match
    result = false
    value.each do |current_value|
      next if condition_value.exclude?(current_value)

      result = true

      break
    end
    result
  end
end
