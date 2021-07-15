require 'test_helper'

class Public::CommoditiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_commodities_index_url
    assert_response :success
  end

  test "should get show" do
    get public_commodities_show_url
    assert_response :success
  end

end
