class ApplicationController < ActionController::Base
  # クロスサイトリクエストフォージェリ対策
  protect_from_forgery with: :exception
  include SessionsHelper

  # 例外処理
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from Exception, with: :render_500
  
  def render_404
    render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html', formats: :html
  end

  def render_500
    render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html', formats: :html
  end

  private

    # ユーザーのログインを確認する。
    def logged_in_user
        unless logged_in?
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to login_url
        end
    end
end
