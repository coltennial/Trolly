FactoryBot.define do
  factory :house do
    user { nil }
    price { 1.5 }
    mobile { false }
    city { "MyString" }
    description { "MyText" }
  end
end
