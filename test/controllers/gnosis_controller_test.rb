require 'test_helper'

class GnosisControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
