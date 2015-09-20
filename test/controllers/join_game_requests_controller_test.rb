require 'test_helper'

class JoinGameRequestsControllerTest < ActionController::TestCase
  test "should get send_request" do
    get :send_request
    assert_response :success
  end

  test "should get answer_request" do
    get :answer_request
    assert_response :success
  end

end
