class PostsController < ApplicationController
  attr_reader :all_posts
  attr_accessor :new_post
  def index
  	@all_posts = Post.all
  end

  def create
  	Post.create(post_params.merge(published: true))
  end

  def new
  	@new_post = Post.new
  end
private
  
  def post_params
  	params.require(:post).permit(:title, :body)
  end  
end
