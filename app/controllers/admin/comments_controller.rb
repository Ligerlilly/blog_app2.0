class Admin::CommentsController < Admin::BaseController
	def index
		@comments = Comment.paginate(page: params[:page], per_page: 5).order('created_at DESC')
	end
end