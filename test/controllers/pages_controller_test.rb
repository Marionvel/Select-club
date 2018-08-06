require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

#La route du Login correspond à l'action
test "should get new" do
  get login_path
  assert_response :success
end

#test "should get secret" do
  #get user_path
  ##assert_not flash.empty?
  #end

end
