#DevsQuest, https://devsquest.com/

class Controllers::TemplatesControllerPolicy < Controllers::ApplicationControllerPolicy
  default_permit!(['ticket.agent', 'admin.template'])
end
