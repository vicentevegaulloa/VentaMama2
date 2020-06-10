require 'test_helper'

class SalePeriodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sale_periods_index_url
    assert_response :success
  end

  test "should get new" do
    get sale_periods_new_url
    assert_response :success
  end

  test "should get create" do
    get sale_periods_create_url
    assert_response :success
  end

  test "should get edit" do
    get sale_periods_edit_url
    assert_response :success
  end

  test "should get update" do
    get sale_periods_update_url
    assert_response :success
  end

  test "should get destroy" do
    get sale_periods_destroy_url
    assert_response :success
  end

  test "should get show" do
    get sale_periods_show_url
    assert_response :success
  end

end
