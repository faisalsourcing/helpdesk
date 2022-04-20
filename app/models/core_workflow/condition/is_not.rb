#DevsQuest, https://devsquest.com/

class CoreWorkflow::Condition::IsNot < CoreWorkflow::Condition::Backend
  def match
    return true if value.blank?

    result = true
    value.each do |current_value|
      next if condition_value.exclude?(current_value)

      result = false

      break
    end
    result
  end
end
