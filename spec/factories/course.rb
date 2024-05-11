FactoryBot.define do
  factory :course do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    start_date { Date.today }
    end_date { Date.today + 1.month }
  end
end
