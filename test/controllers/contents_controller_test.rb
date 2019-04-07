require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get contents_list_url
    assert_response :success
  end

end
