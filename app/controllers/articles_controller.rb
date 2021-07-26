# frozen_string_literal: true

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
    @articles_new = Article.all.order(created_at: :desc)
    @articles_new = Kaminari.paginate_array(@articles_new).page(params[:page])
    # tagを押したとき、同じタグが付いているもののみを表示
    @articles_new = Article.tagged_with(params[:tag_name].to_s) if params[:tag_name]
  end

  def index_favorite
    @articles_favorite = Article.includes(:favorites).sort { |a, b| b.favorites.count <=> a.favorites.count }.page(params[:page])
    @articles_favorite = Article.tagged_with(params[:tag_name].to_s) if params[:tag_name]
  end

  def index_comment
    @articles_comment = Article.includes(:comments).sort { |a, b| b.comments.count <=> a.comments.count }.page(params[:page])
    @articles_comment = Article.tagged_with(params[:tag_name].to_s) if params[:tag_name]
  end

  def show
    @article = Article.find(params[:id])
    @comment_new = Comment.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :introduction, :url, :tag_list)
  end
end
