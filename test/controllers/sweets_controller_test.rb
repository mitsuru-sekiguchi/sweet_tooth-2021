require 'test_helper'

class SweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sweets_index_url
    assert_response :success
  end

end
