class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.new(
      title: allowed_params[:title],
      text: allowed_params[:text],
      author_id: @user.id,
      CommentsCounter: 0,
      LikesCounter: 0
    )
    if @post.save
      redirect_to action: 'show', id: @post.id
      flash.now[:notice] = 'Post created'
    else
      redirect_to :back
      flash.now[:notice] = 'An error has occurred'
    end
  end

  def allowed_params
    params.require(:post).permit(:title, :text, :user_id)
  end
end
