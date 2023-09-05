require "test_helper"

class FixersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get fixers_show_url
    assert_response :success
  end
end
