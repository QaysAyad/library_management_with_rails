class BorrowedBook < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates_uniqueness_of :book

  # true if book return date has passed, false otherwise
  def late?
   returning_at.past? 
  end
end
