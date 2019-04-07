require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest

  test "should get list" do
    get contents_list_url
    assert_response :success
    assert_select "title", "List | Media App"
  end

end
