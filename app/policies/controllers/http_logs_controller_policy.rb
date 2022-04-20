#DevsQuest, https://devsquest.com/

class Controllers::HttpLogsControllerPolicy < Controllers::ApplicationControllerPolicy
  default_permit!('admin.*')
end
