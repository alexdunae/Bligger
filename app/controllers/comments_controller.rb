class CommentsController < ApplicationController
	def create
		respond_to do |fmt|
			fmt.js {
				@the_comment = Comment.create!(comment_params)
			}
		end
	end
	def moderate
		@all_comments = Comment.all
	end
	def edit
		@the_comment = Comment.find(params[:id])
	end
	def preview
		print 'the preview method is called'
	end
	attr_reader :all_comments
private
	def comment_params
		params.require(:comment).permit(:name,:body,:post_id)
	end
end
