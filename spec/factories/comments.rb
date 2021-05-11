FactoryBot.define do
  factory :comment do
    text { 'test,test,test' }
    association :user
    association :item
  end
end
