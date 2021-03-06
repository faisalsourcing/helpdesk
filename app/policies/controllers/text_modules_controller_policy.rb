#DevsQuest, https://devsquest.com/

class Controllers::TextModulesControllerPolicy < Controllers::ApplicationControllerPolicy
  permit! %i[index show], to: ['ticket.agent', 'admin.text_module']
  permit! %i[create update destroy import_example import_start], to: 'admin.text_module'
end
