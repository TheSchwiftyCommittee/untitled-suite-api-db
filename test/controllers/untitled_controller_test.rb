require 'test_helper'

class UntitledControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get untitled_index_url
    assert_response :success
  end

end
