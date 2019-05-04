require 'test_helper'

class ContentsUpdateTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:masato)
  end
  
  test "valid content information" do
    # ログインする
    logged_in @user

    @content_before = @user.contents.first
    get content_path(@content_before)
    assert_select "a[href=?]", edit_content_path(@content_before)

    get edit_content_path(@content_before)
    assert_template 'contents/edit'

    patch post_path(@content_before), params: { content: { id: @content_before.id, title: "Meteor is cool", text: "Cooooool" } }
    follow_redirect!
    assert_template 'contents/show'
    @content_after = @user.contents.first
    assert_not_equal(@content_before.title, @content_after.title)
    assert_not_equal(@content_before.text, @content_after.text)
  end

  # invalid
  # not login
  # another user login

end
