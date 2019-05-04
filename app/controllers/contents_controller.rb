class ContentsController < ApplicationController
  before_action :logged_in_user,   only: [:new, :create, :edit, :update, :destroy]
  before_action :not_exists_content, only: [:show, :edit]

  def new
    @content = Content.new
  end

  def create
    @content = @current_user.contents.build(content_params)
    if @content.save
      flash[:success] = "記事を投稿しました"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def index
    @contents = Content.paginate(page: params[:page], per_page: 10, total_entries: Content.all.count)
  end

  def show 
    @content = Content.find(params[:id])
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    @content = Content.find(params[:content][:id])
    if @content && @content.update_attributes(content_params)
      flash[:success] = "記事を編集しました"
      redirect_to @content
    else
      render 'edit'
    end
  end

  def destroy

  end

    private

    def content_params
      # requireで必要分だけ使用可能にすることでセキュリティが向上する
      params.require(:content).permit(:title, :text, :image)
    end

    # 記事が存在しない場合
    def not_exists_content
      unless Content.exists?(:id => params[:id])
        redirect_to root_path
      end
    end

end
