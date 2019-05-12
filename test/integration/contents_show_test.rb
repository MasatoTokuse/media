require 'test_helper'

class ContentsShowTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:masato)
  end
  
  test "content is exist" do
    @content = @user.contents.first
    get content_path(@content)
    assert_template 'contents/show'
  end

  test "content is not exist" do
    @content = Content.new
    @content.id = 0
    get content_path(@content)
    assert_template 'errors/error_404'
  end
end
