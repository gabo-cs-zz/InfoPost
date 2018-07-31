require 'test_helper'

class MyProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get my_profile" do
    get my_profile_my_profile_url
    assert_response :success
  end

end
