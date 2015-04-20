class CommentsController < ApplicationController
	def create
		respond_to do |fmt|
			fmt.js {
				@the_comment = Comment.create!(comment_params)
			}
		end
	end
	def destroy
		Comment.destroy(params[:id])
	end
	def moderate
		@all_comments = Comment.all
	end
	def edit
		# I'm naming things the same way wordpress's c-style api does
		# prefixing 'the' in front of things
		@the_comment = Comment.find(params[:id])
		@the_post = Post.find(@the_comment.post_id)
	end
	def preview
		print 'the preview method is called'
		@the_comment = Comment.find(params[:id])
	end
	def update
		Comment.find(params[:id]).update(comment_params)
		redirect_to :action=>'moderate'
	end
	attr_reader :all_comments
private
	def comment_params
		params.require(:comment).permit(:name,:body,:post_id)
	end
end
