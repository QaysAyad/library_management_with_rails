FactoryBot.define do
  factory :borrowed_book, class: BorrowedBook do
    user { create(:user) }
    book { create(:book) }
    returning_at { DateTime.now } 
  end
end


