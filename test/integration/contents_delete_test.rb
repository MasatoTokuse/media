require 'test_helper'

class ContentsDeleteTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:masato)
  end

  test "success" do
    # ログインする
    logged_in @user

    @content_before = @user.contents.first
    get content_path(@content_before)
    assert_select "a[href=?]", content_path(@content_before)

    assert_difference "Content.count", -1 do
      delete content_path(@content_before)
    end

    follow_redirect!
    assert_template "contents/index"
    assert_not flash.empty?
  end

  test "not login" do
    @content_before = @user.contents.first
    delete content_path(@content_before)
    not_logged_in_user
  end

  test "user cannot delete another user's content" do
    # 別ユーザーでログインする
    @another_user = users(:another)
    logged_in @another_user

    @content_before = @user.contents.first
    get content_path(@content_before)
    assert_select "a[href=?]", content_path(@content_before), count:0
  end
end
