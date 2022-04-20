#DevsQuest, https://devsquest.com/

devsquest::Application.routes.draw do
  api_path = Rails.configuration.api_path

  match api_path + '/integration/github',                to: 'integration/github#query',   via: :post
  match api_path + '/integration/github',                to: 'integration/github#query',   via: :get
  match api_path + '/integration/github/verify',         to: 'integration/github#verify',  via: :post
  match api_path + '/integration/github_ticket_update',  to: 'integration/github#update',  via: :post

end
