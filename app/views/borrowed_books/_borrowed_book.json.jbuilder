json.extract! borrowed_book, :id, :book_id, :user_id, :returning_at, :created_at, :updated_at
json.url borrowed_book_url(borrowed_book, format: :json)
