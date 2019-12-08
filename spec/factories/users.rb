FactoryBot.define do 
  factory :user do 
    password = Faker::Internet.password(min_length: 6)
    email = 
  nickname                { Faker::JapaneseMedia::DragonBall.character }
    email                 { Faker::Internet.email }

    password              { password }
    password_confirmation { password }
  end
end
