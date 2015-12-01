class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  swagger_controller :books, "Books"

  swagger_api :index do
    summary "Fetches all Book items"
    notes "This lists all books"
    param :query, :page, :integer, :optional, "Page number"
    response :ok, "Success", :Book
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"
    response :requested_range_not_satisfiable
  end
  # GET /books
  def index
    @books = Book.all

    render json: @books
  end

  swagger_api :show do
    summary "Fetches a single User item"
    param :path, :id, :integer, :optional, "User Id"
    response :ok, "Success", :Book
    response :unauthorized
    response :not_acceptable
    response :not_found
  end
  # GET /books/1
  def show
    render json: @book
  end

  swagger_api :create do
    summary "Creates a new Book"
    param :form, :title, :string, :required, "Title"
    param :form, :description, :string, :required, "Description"
    param :form, :page_count, :integer, :required, "Page count"
    response :created, "Success", :Book
    response :unauthorized
    response :not_acceptable
  end
  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  swagger_api :update do
    summary "Creates a new Book"
    param :path, :id, :integer, :required, "Book Id"
    param :form, :title, :string, :required, "Title"
    param :form, :description, :string, :required, "Description"
    param :form, :page_count, :integer, :required, "Page count"
    response :created, "Success", :Book
    response :unauthorized
    response :not_acceptable
  end
  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  swagger_api :destroy do
    summary "Deletes an existing Book item"
    param :path, :id, :integer, :optional, "Book Id"
    response :unauthorized
    response :not_found
  end
  # DELETE /books/1
  def destroy
    @book.destroy
  end

  swagger_model :Book do
    description "A Tag object."
    property :id, :integer, :required, "Book Id"
    property :title, :string, :required, "Title"
    property :description, :string, :optional, "Description"
    property :page_count, :integer, :optional, "Page count"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:title, :page_count, :description)
    end
end
