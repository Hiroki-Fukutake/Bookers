class PostsController < ApplicationController
  def top
  end
  def new
  	@post = Post.new
  end
  def create
	  	@post = Post.new(post_params)
	  	if @post.save
	  	flash[:success] = "Book was successfully created."
	  	redirect_to post_path(@post)
	    else
	   	@posts = Post.all
	  	render :index
	    end
  end
  def index
  	@post = Post.new
  	@posts = Post.all
  end
  def show
  	@post = Post.find(params[:id])
  	flash[:notice] = ""
  end
  def edit
  	@post = Post.find(params[:id])
  end
  def update
  	post = Post.find(params[:id])
  	post.update(post_params)
  	redirect_to post_path(post.id)
  end
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end
  private
  def post_params
  	params.require(:post).permit(:title,:body)
  end
end
