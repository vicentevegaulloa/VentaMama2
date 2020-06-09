require 'test_helper'

class SaleProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sale_products_index_url
    assert_response :success
  end

  test "should get show" do
    get sale_products_show_url
    assert_response :success
  end

  test "should get new" do
    get sale_products_new_url
    assert_response :success
  end

  test "should get create" do
    get sale_products_create_url
    assert_response :success
  end

  test "should get edit" do
    get sale_products_edit_url
    assert_response :success
  end

  test "should get update" do
    get sale_products_update_url
    assert_response :success
  end

  test "should get destroy" do
    get sale_products_destroy_url
    assert_response :success
  end

end
