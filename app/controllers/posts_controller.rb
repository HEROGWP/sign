class PostsController < ApplicationController
  before_action :authenticate_user, only: [ :create, :index, :destroy ]
  def index
		@posts = Post.all
		@post = current_user.posts.build		
  end
  
  def new
                @post = current_user.posts.build
  end

  def create
  	@post = current_user.posts.build(create_params)
  	if @post.save
  		flash[:success] = "Posted successfully"
  		redirect_to post_path
  	else
  		render "new"
  	end
  end

  def destroy
  	@post = Post.find(params[:id])
  	if current_user(@post.user)
		@post.destroy
	  	flash[:success] = "Post deleted"
	else
	  	flash[:error] = "Cannot delete post"
	end
  	redirect_to post_path
  end

  private

  def create_params
  	params.require(:post).permit(:content)
  end
end
