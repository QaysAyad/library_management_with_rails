require 'test_helper'
require 'factory_bot_rails'

class BorrowedBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @borrowed_book = create(:borrowed_book)
  end

  test "should get index" do
    get borrowed_books_url
    assert_response :success
  end

  test "should get new" do
    get new_borrowed_book_url
    assert_response :success
  end

  test "should create borrowed_book" do
    book = create(:book)
    assert_difference('BorrowedBook.count') do
      post borrowed_books_url, params: { borrowed_book: { book_id: book.id, returning_at: @borrowed_book.returning_at, user_id: @borrowed_book.user_id } }
    end

    assert_redirected_to borrowed_book_url(BorrowedBook.last)
  end

  test "should show borrowed_book" do
    get borrowed_book_url(@borrowed_book)
    assert_response :success
  end

  test "should destroy borrowed_book" do
    assert_difference('BorrowedBook.count', -1) do
      delete borrowed_book_url(@borrowed_book)
    end

    assert_redirected_to borrowed_books_url
  end

  test "should not borrow same book twice" do
    book = create(:book)
    assert_difference('BorrowedBook.count', 1) do
      post borrowed_books_url, params: { borrowed_book: { book_id: book.id, returning_at: @borrowed_book.returning_at, user_id: @borrowed_book.user_id } }
      post borrowed_books_url, params: { borrowed_book: { book_id: book.id, returning_at: @borrowed_book.returning_at, user_id: @borrowed_book.user_id } }
    end
  end
end
