#DevsQuest, https://devsquest.com/

class CoreWorkflow::Result::AddOption < CoreWorkflow::Result::BaseOption
  def run
    @result_object.result[:restrict_values][field] |= Array(@perform_config['add_option'])
    true
  end
end
