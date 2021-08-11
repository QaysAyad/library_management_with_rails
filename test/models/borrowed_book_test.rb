require 'test_helper'

class BorrowedBookTest < ActiveSupport::TestCase
  test "fails on duplicate book_id" do
    borrowed_book = create(:borrowed_book)
    borrowed_book2 = build(:borrowed_book, book: borrowed_book.book)
    assert( borrowed_book2.errors[:book] )
  end

  test "late should be true" do
    borrowed_book = BorrowedBook.new returning_at: 1.day.ago
    assert( borrowed_book.late? )
  end
  
  test "late should be false when " do
    borrowed_book = BorrowedBook.new returning_at: 1.day.from_now
    assert( !borrowed_book.late? )
  end
end
