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
    if Content.count > 0
      @contents = Content.page(params[:page]).per(15)
    else
      render 'not_content'
    end
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
    @content = Content.find(params[:id])
    if @content && @content.destroy
      flash[:success] = "記事を削除しました"
      redirect_to root_url
    else
      render 'show'
    end
  end

    private

    def content_params
      # requireで必要分だけ使用可能にすることでセキュリティが向上する
      params.require(:content).permit(:title, :text, :image)
    end

    # 記事が存在しない場合
    def not_exists_content
      unless Content.exists?(:id => params[:id])
        render_404
      end
    end

end
