require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

#La route du Login correspond à l'action
  test "should get new" do
    get login_path
    assert_response :success
  end

end
