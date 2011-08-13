require 'test_helper'

class Users::OmniauthCallbacksControllerTest < ActionController::TestCase
  test "should get facebook" do
    get :facebook
    assert_response :success
  end

  test "should get open_id" do
    get :open_id
    assert_response :success
  end

end
