FactoryBot.define do
  factory :book do
    sequence(:title) { |n| "Title #{n}" }
  end
end
