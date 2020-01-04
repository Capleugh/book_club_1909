FactoryBot.define do
  factory :book do
    sequence(:title) { |n| "Title #{n}" }
    sequence(:publication_year, 1936) { |n| "#{n}" }
    sequence(:pages, 350) { |n| "#{n}" }
    author
  end
end
