#DevsQuest, https://devsquest.com/

devsquest::Application.routes.draw do

  match '/api/v1/cti/:token',     to: 'integration/cti#event',    via: :post

end
