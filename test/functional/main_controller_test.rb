require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get default" do
    get :default
    assert_response :success
  end

end
