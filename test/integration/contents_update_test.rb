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

  test "invalid content information" do
    # ログインする
    logged_in @user

    @content_before = @user.contents.first
    get content_path(@content_before)
    assert_select "a[href=?]", edit_content_path(@content_before)

    get edit_content_path(@content_before)
    assert_template 'contents/edit'

    patch post_path(@content_before), params: { content: { id: @content_before.id, title: "", text: "" } }
    assert_template 'contents/edit'
    assert_select "div#error_explanation"
    assert_select "div.alert-danger"
  end

  test "not login" do
    @content_before = @user.contents.first
    get edit_content_path(@content_before)
    not_logged_in_user
  end

  test "user cannot edit another user's content" do
    # 別ユーザーでログインする
    @another_user = users(:another)
    logged_in @another_user

    @content_before = @user.contents.first
    get content_path(@content_before)
    assert_select "a[href=?]", edit_content_path(@content_before), count:0
  end

end
