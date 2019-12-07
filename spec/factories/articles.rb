FactoryBot.define do 
  factory :article do 
    title       { Faker::Book.title }
    body        { Faker::Lorem.sentence }
    # userとarticleの関連づけ
    user
  end
end
