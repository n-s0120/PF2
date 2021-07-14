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
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments.order(created_at: :desc)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :introduction, :url)
  end
end
