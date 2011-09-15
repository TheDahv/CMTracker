require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get attendances" do
    get :attendances
    assert_response :success
  end

end
