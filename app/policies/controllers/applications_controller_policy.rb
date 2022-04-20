#DevsQuest, https://devsquest.com/

class Controllers::ApplicationsControllerPolicy < Controllers::ApplicationControllerPolicy
  default_permit!('admin.api')
end
