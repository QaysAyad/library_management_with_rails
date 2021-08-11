FactoryBot.define do
  factory :book, class: Book do
    name { "Story" }
    description { "Long description" }
  end
end
