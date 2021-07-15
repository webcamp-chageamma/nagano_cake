require 'test_helper'

class Admin::CommoditiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_commodities_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_commodities_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_commodities_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_commodities_edit_url
    assert_response :success
  end

end
