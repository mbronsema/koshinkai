class CommentsController < ApplicationController

  def create
    @post = Post.find(prarams[:id])
    @comment = Comment.new(comment_params)
    @comment.reacteble = 
  end

  private
  def comment_params 
    params.require(:comment).permit(:title, :message)
  end



end
