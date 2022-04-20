#DevsQuest, https://devsquest.com/

# This file is used by Rack-based servers to start the application.

require ::File.expand_path('config/environment', __dir__)
run devsquest::Application

# set config to do no self notification
Rails.configuration.webserver_is_active = true
