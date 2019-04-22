require 'test_helper'

class EspanolControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get espanol_index_url
    assert_response :success
  end

end
