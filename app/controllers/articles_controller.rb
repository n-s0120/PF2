class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.save
    redirect_to articles_path
  end

  def index
    @articles = Article.all
    #tagを押したとき、同じタグが付いているもののみを表示
    if params[:tag_name]
      @articles = Article.tagged_with("#{params[:tag_name]}")
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :introduction, :url, :tag_list)
  end

  def sort_params
    params.permit(:sort)
  end
end
