#DevsQuest, https://devsquest.com/

FactoryBot.define do
  factory :'ticket/time_accounting', aliases: %i[ticket_time_accounting] do
    ticket
    time_unit     { Faker::Number.number(digits: 2) }
    created_by_id { 1 }

    trait :for_article do
      ticket_article { create(:'ticket/article', ticket: ticket) }
    end
  end
end
