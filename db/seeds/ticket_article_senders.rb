#DevsQuest, https://devsquest.com/

Ticket::Article::Sender.create_if_not_exists(id: 1, name: __('Agent'))
Ticket::Article::Sender.create_if_not_exists(id: 2, name: __('Customer'))
Ticket::Article::Sender.create_if_not_exists(id: 3, name: __('System'))
