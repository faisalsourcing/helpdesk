#DevsQuest, https://devsquest.com/

# Rails' constant auto-loading resolves to 'rails/initializable' instead
require 'devsquest/application/initializer/session_store'

devsquest::Application::Initializer::SessionStore.perform
