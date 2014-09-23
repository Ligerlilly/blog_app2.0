class CommentsController < ApplicationController
  before_action :load_commentable

  def new
    @comment = @commentable.comments.new
  end

  def index
    @comments = @commentable.comments
  end 

  def create
    @comment = @commentable.comments.new(params[:comment])
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to entry_path(@comment.commentable)
    else
      redirect_to entries_path, alert: 'Comment error'
  end

  private
  
  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resoure.singularize.classify.constantize.find(id)
  end
end
