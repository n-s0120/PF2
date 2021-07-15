class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = current_user.comments.new(comment_params)
    @comment.article_id = @article.id
    if @comment.save
      render :comment
    else
      render 'comments/show'
    end
  end

  def destroy
    Comment.find_by(id: params[:id], article_id: params[:article_id]).destroy
    render :comment
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :article_id, :user_id)
  end
end
