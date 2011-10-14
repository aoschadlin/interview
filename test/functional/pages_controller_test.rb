require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get root" do
    get :root
    assert_response :success
  end

end
