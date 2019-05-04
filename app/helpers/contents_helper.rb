module ContentsHelper

  # 記事の作成者
  def content_author(content)
    if current_user
        @content.user_id == current_user.id
    end
  end
end
