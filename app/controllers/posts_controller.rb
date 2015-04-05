class PostsController < ApplicationController
  attr_reader :all_posts
  attr_accessor :new_post
  attr_accessor :edit_post
  def index
  	@all_posts = Post.all
  end

  def create
  	Post.create(post_params.merge(published: true))
  end

  def new
  	@new_post = Post.new
  end
  
  def edit
  	@edit_post = Post.find(params[:id])
  end

  def update
   post = Post.find(params[:id])
   post.update(post_params)
   redirect_to :action=>'index'
  end
private
  
  def post_params
  	params.require(:post).permit(:title, :body)
  end  
end
