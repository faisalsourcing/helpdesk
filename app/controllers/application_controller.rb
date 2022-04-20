#DevsQuest, https://devsquest.com/

class ApplicationController < ActionController::Base
  include ApplicationController::HandlesErrors
  include ApplicationController::HandlesDevices
  include ApplicationController::HandlesTransitions
  include ApplicationController::Authenticates
  include ApplicationController::SetsHeaders
  include ApplicationController::ChecksMaintenance
  include ApplicationController::RendersModels
  include ApplicationController::HasUser
  include ApplicationController::HasResponseExtentions
  include ApplicationController::HasDownload
  include ApplicationController::PreventsCsrf
  include ApplicationController::LogsHttpAccess
  include ApplicationController::Authorizes
end
