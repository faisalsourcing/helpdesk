#DevsQuest, https://devsquest.com/

# Rails' constant auto-loading resolves to 'rails/initializable' instead
require 'devsquest/application/initializer/db_preflight_check'

devsquest::Application::Initializer::DbPreflightCheck.perform
