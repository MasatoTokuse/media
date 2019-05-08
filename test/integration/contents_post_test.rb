require 'test_helper'

class ContentsPostTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:masato)
  end
  
  test "invalid content information" do
    # ログインする
    logged_in @user
    get post_path
    assert_template "contents/new"
    assert_no_difference "Content.count" do
      post post_path, params: { content: { title: "", text: ""} }
    end
    assert_template "contents/new"
    assert_select "div#error_explanation"
    assert_select "div.alert-danger"
  end

  test "valid content information" do
    # ログインする
    logged_in @user
    get post_path
    assert_template "contents/new"
    assert_difference "Content.count", 1 do
      post post_path, params: { content: { title: "タイトル", text: "テキスト本文"} }
    end
    follow_redirect!
    assert_template "contents/index"
    assert_not flash.empty?
  end

  test "user isn't logged in then, get path" do
    get post_path
    not_logged_in_user

    # ログインする
    logged_in @user
    follow_redirect!
    assert_template "contents/new"
  end

  test "user isn't logged in then, post path" do
    post post_path
    not_logged_in_user
  end

end
