class BorrowedBooksController < ApplicationController
  before_action :set_borrowed_book, only: %i[ show destroy ]

  # GET /borrowed_books or /borrowed_books.json
  def index
    @borrowed_books = BorrowedBook.all
  end

  # GET /borrowed_books/1 or /borrowed_books/1.json
  def show
  end

  # GET /borrowed_books/new
  def new
    @borrowed_book = BorrowedBook.new
  end

  # POST /borrowed_books or /borrowed_books.json
  def create
    @borrowed_book = BorrowedBook.new(borrowed_book_params)

    respond_to do |format|
      if @borrowed_book.save
        format.html { redirect_to @borrowed_book, notice: "Borrowed book was successfully created." }
        format.json { render :show, status: :created, location: @borrowed_book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @borrowed_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /borrowed_books/1 or /borrowed_books/1.json
  def destroy
    @borrowed_book.destroy
    respond_to do |format|
      format.html { redirect_to borrowed_books_url, notice: "Borrowed book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borrowed_book
      @borrowed_book = BorrowedBook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def borrowed_book_params
      params.require(:borrowed_book).permit(:book_id, :user_id, :returning_at)
    end
end
