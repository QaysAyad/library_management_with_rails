require "application_system_test_case"

class BorrowedBooksTest < ApplicationSystemTestCase
  setup do
    @borrowed_book = borrowed_books(:one)
  end

  test "visiting the index" do
    visit borrowed_books_url
    assert_selector "h1", text: "Borrowed Books"
  end

  test "creating a Borrowed book" do
    visit borrowed_books_url
    click_on "New Borrowed Book"

    fill_in "Book", with: @borrowed_book.book_id
    fill_in "Returning at", with: @borrowed_book.returning_at
    fill_in "User", with: @borrowed_book.user_id
    click_on "Create Borrowed book"

    assert_text "Borrowed book was successfully created"
    click_on "Back"
  end

  test "updating a Borrowed book" do
    visit borrowed_books_url
    click_on "Edit", match: :first

    fill_in "Book", with: @borrowed_book.book_id
    fill_in "Returning at", with: @borrowed_book.returning_at
    fill_in "User", with: @borrowed_book.user_id
    click_on "Update Borrowed book"

    assert_text "Borrowed book was successfully updated"
    click_on "Back"
  end

  test "destroying a Borrowed book" do
    visit borrowed_books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Borrowed book was successfully destroyed"
  end
end
