require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post :create, params: { book: { description: @book.description, page_count: @book.page_count, title: @book.title } }
    end

    assert_response 201
  end

  test "should show book" do
    get :show, params: { id: @book }
    assert_response :success
  end

  test "should update book" do
    patch :update, params: { id: @book, book: { description: @book.description, page_count: @book.page_count, title: @book.title } }
    assert_response 200
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete :destroy, params: { id: @book }
    end

    assert_response 204
  end
end
