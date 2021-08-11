class Book < ApplicationRecord
    has_one :borrowed_book

    scope :available, -> { left_joins(:borrowed_book).where("borrowed_books.id IS NULL")}
 
end
