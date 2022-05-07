class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(
      text: allowed_params[:text],
      author_id: current_user.id,
      post_id: @post.id
    )
    if @comment.save
      redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", notice: 'Success!'
    else
      render :new, alert: 'Error occurred!'
    end
  end

  def allowed_params
    params.require(:comment).permit(:text)
  end
end
