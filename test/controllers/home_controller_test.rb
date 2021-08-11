require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get the root page" do
    get root_path
    assert_response :success
  end

end
