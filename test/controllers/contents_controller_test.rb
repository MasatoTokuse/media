require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest

  test "should get list" do
    get root_url
    assert_response :success
    assert_select "title", full_title("List")
  end

end
