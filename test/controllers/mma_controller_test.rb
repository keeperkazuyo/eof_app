require 'test_helper'

class MmaControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get mma_top_url
    assert_response :success
  end

end
