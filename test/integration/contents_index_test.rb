require 'test_helper'

class ContentsIndexTest < ActionDispatch::IntegrationTest

  test "content is not exist" do
    Content.delete_all
    get root_path
    assert_template 'contents/not_content'
  end

  test "contents are exist" do
    get root_path
    assert_template 'contents/index'
  end

end