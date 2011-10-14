require 'test_helper'

class HiringManagerControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
