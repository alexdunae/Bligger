class PostsController < ApplicationController
  attr_reader :all_posts
  attr_accessor :new_post
  attr_accessor :edit_post
  attr_reader :the_post
  def index
  	@all_posts = Post.all
  end
  
  def edit_posts
  	index
  end

  def create
  	Post.create(post_params.merge(published: true))
  	redirect_to :action=>'index'
  end

  def new
  	@new_post = Post.new
  end
  
  def edit
  	@edit_post = Post.find(params[:id])
  end
  
  def show
  	@the_post = Post.find(params[:id])
  end

  def update
   post = Post.find(params[:id])
   post.update(post_params)
   redirect_to :action=>'index'
  end
  
  def destroy
  	Post.destroy(params[:id])
  	@destroy_post_id = 'post'+params[:id].to_s
  	puts 'going to destroy: '+@destroy_post_id
  	#redirect_to :action=>'index'
  	respond_to do |fmt|
  		fmt.html {  }
  		fmt.js {
  			print 'responding with destroy response'
  			render 'destroy'
  			#render 'destroy_response'
  		}
  	end
  end
private
  
  def post_params
  	params.require(:post).permit(:title, :body)
  end  
end
