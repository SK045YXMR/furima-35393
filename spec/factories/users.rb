FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { 'test1234TEST' }
    password_confirmation { password }
    last_name { Gimei.last.kanji }
    first_name { Gimei.first.kanji }
    last_name_kana { Gimei.last.katakana }
    first_name_kana { Gimei.first.katakana }
    birth_date { '1991-01-01' }
  end
end
