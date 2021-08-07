class CreateBorrowedBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :borrowed_books do |t|
      t.references :book, index: {:unique=>true}, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :returning_at

      t.timestamps
    end
  end
end
