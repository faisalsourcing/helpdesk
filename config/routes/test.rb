#DevsQuest, https://devsquest.com/

if !Rails.env.production?
  devsquest::Application.routes.draw do
    get '/tests_:name', to: 'tests#show'

    match '/tests/wait/:sec',                   to: 'tests#wait',                       via: :get
    match '/tests/raised_exception',            to: 'tests#error_raised_exception',     via: :get
  end
end
