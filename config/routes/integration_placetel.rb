#DevsQuest, https://devsquest.com/

devsquest::Application.routes.draw do

  match '/api/v1/placetel/:token',     to: 'integration/placetel#event',    via: :post

end
