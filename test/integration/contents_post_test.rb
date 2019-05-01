require 'test_helper'

class ContentsPostTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:masato)
    # ログインする
    logged_in @user
  end
  
  test "invalid content information" do
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
    get post_path
    assert_template "contents/new"
    assert_difference "Content.count", 1 do
      post post_path, params: { content: { title: "タイトル", text: "テキスト本文"} }
    end
    follow_redirect!
    assert_template "contents/index"
    assert_not flash.empty?
  end
end
