class CommentsController < ApplicationController
before_filter :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.user_id = current_user.id
    @comment.reactable = @post
    if @comment.save
      redirect_to @post
    else
      redirect_to root_path
    end
  end

  def update 

  end

  private
  def comment_params 
    params.require(:comment).permit(:title, :message, :user_id, :reactable_type, :reactable_id)
  end

end