#DevsQuest, https://devsquest.com/

org_community = Organization.create_if_not_exists(
  id:   1,
  name: __('devsquest Foundation'),
)
user_community = User.create_or_update(
  id:              2,
  login:           'nicole.braun@devsquest.org',
  firstname:       'Nicole',
  lastname:        'Braun',
  email:           'nicole.braun@devsquest.org',
  password:        '',
  active:          true,
  roles:           [ Role.find_by(name: 'Customer') ],
  organization_id: org_community.id,
)

UserInfo.current_user_id = user_community.id

if Ticket.count.zero?
  ticket = Ticket.create!(
    group_id:    Group.find_by(name: 'Users').id,
    customer_id: User.find_by(login: 'nicole.braun@devsquest.org').id,
    title:       __('Welcome to devsquest!'),
  )
  Ticket::Article.create!(
    ticket_id: ticket.id,
    type_id:   Ticket::Article::Type.find_by(name: 'phone').id,
    sender_id: Ticket::Article::Sender.find_by(name: 'Customer').id,
    from:      'devsquest Feedback <feedback@devsquest.org>',
    body:      'Welcome!

  Thank you for choosing devsquest.

  You will find updates and patches at https://devsquest.org/. Online
  documentation is available at https://devsquest.org/documentation. Get
  involved (discussions, contributing, ...) at https://devsquest.org/participate.

  Regards,

  Your devsquest Team
  ',
    internal:  false,
  )
end

UserInfo.current_user_id = 1
