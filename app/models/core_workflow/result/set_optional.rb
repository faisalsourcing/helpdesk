#DevsQuest, https://devsquest.com/

class CoreWorkflow::Result::SetOptional < CoreWorkflow::Result::Backend
  def run
    @result_object.result[:mandatory][field] = false
    true
  end
end
