require 'test_helper'

class ContentTest < ActiveSupport::TestCase

  def setup
    @user = users(:masato)
    # @content = Content.new(title: "タイトル", text: "本文", user: @user)
    @content = @user.contents.build(title: "ブラックホールの実証に成功", text: "成功しました。")
  end

  test "should be valid" do
    assert @content.valid?
  end

  test "user id should be present" do
    @content.user_id = nil
    assert_not @content.valid?
  end

  test "title should be present" do
    @content.title = "   "
    assert_not @content.valid?
  end

  test "title should be at most 50 characters" do
    @content.title = "a" * 50
    assert @content.valid?
    @content.title = "a" * 51
    assert_not @content.valid?
  end

  test "text should be present" do
    @content.text = "   "
    assert_not @content.valid?
  end

  test "text should be at most 400 characters" do
    @content.text = "a" * 400
    assert @content.valid?
    @content.text = "a" * 401
    assert_not @content.valid?
  end

  test "order should be most recent first" do
    assert_equal contents(:most_recent), Content.first
  end

end