require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end


  def setup
    @user = users(:roger)
    @user2 = users(:poussin)
    @all_users = []
    @all_users << users(:roger)
    @all_users << users(:poussin)
  end


  #Se loger avec des infos invalide 
  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end


  test "login with valid information" do

    get login_path
    post login_path, params: { session: { email: @user.email,
                                        password: 'password' } }

    get root_path

    assert_no_match "a[href=?]", login_path
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end

end




