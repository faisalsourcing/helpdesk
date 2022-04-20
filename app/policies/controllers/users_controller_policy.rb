#DevsQuest, https://devsquest.com/

class Controllers::UsersControllerPolicy < Controllers::ApplicationControllerPolicy
  permit! %i[import_example import_start unlock], to: 'admin.user'
  permit! %i[search history create update], to: ['ticket.agent', 'admin.user']
end
