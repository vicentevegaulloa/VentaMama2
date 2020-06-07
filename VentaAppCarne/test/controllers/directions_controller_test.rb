require 'test_helper'

class DirectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get directions_index_url
    assert_response :success
  end

  test "should get new" do
    get directions_new_url
    assert_response :success
  end

  test "should get create" do
    get directions_create_url
    assert_response :success
  end

  test "should get show" do
    get directions_show_url
    assert_response :success
  end

  test "should get edit" do
    get directions_edit_url
    assert_response :success
  end

  test "should get update" do
    get directions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get directions_destroy_url
    assert_response :success
  end

end
