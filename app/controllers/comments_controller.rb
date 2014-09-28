class CommentsController < ApplicationController
  before_action :load_commentable

  def new
    @comment = @commentable.comments.new
  end

  def index
    @comments = @commentable.comments
  end 

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { entries_path }
        format.js {} 
        format.json { render json: @comment,
          status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors,
          status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js {} 
      format.json { head :no_content }
    end
  end  

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
  
  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
