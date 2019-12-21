require 'test_helper'

class InputControllerTest < ActionDispatch::IntegrationTest
  test "should get event" do
    get input_event_url
    assert_response :success
  end

end
