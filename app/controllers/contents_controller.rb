class ContentsController < ApplicationController

  def new
    @content = Content.new
  end

  def create
    # @content = Content.new(content_params)
    render 'new'
  end

  def list
  end

  private

  def content_params
    # requireで必要分だけ使用可能にすることでセキュリティが向上する
    # params.require(:content).permit(:title, :content)
  end

end
