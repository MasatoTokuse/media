ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  
  fixtures :all
  include ApplicationHelper

  # テストユーザーがログイン中の場合にtrueを返す
  def is_logged_in?
    !session[:user_id].nil?
  end

  # テストユーザーがログインする
  def logged_in(user)
    post login_path, params:{session:{email: user.email, password:"password"}}
  end

  # ログイン画面に遷移されることを確認する
  def not_logged_in_user
    follow_redirect!
    assert_template "sessions/new"
    assert_not flash.empty?
  end
end
