#DevsQuest, https://devsquest.com/

FactoryBot.define do
  factory :setting do
    title       { 'ABC API Token' }
    name        { Faker::Name.unique.name }
    area        { 'Integration::ABC' }
    description { 'API Token for ABC to access ABC.' }
    frontend    { false }
  end
end
