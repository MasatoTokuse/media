class ContentsController < ApplicationController

  def new
    @content = Content.new
  end

  def create
    if current_user
      @content = @current_user.contents.build(content_params)
      if @content.save
        flash[:success] = "記事を投稿しました"
        redirect_to root_url
      else
        render 'new'
      end
    else
      redirect_to login_path
    end
  end

  def index
    @contents = Content.paginate(page: params[:page], per_page: 10, total_entries: Content.all.count)
  end

  def show 
    @content = Content.find(params[:id])
  end

  private

  def content_params
    # requireで必要分だけ使用可能にすることでセキュリティが向上する
    params.require(:content).permit(:title, :text)
  end

end
