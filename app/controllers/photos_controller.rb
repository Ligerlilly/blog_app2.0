class PhotosController < ApplicationController
  before_action :load_photoable
  before_action :is_user_admin?, except: :show
  
  def new
    @photo = @photoable.photos.new
  end
  
  def show
    @photo = Photo.find(params[:id])
  end
 
  def create
    @photo = @photoable.photos.new(photo_params)
    if @photo.save
      flash[:notice] = "Successfully created photo"
      redirect_to @photoable
    else
      render 'new'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    entry_id =  @photo.photoable_id
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to entry_path(entry_id) }
      format.json { head :no_content }
    end
  end


  private
  
  def photo_params
    params.require(:photo).permit(:caption, :image, :entry_id)
  end

  def load_photoable
    resource, id = request.path.split('/')[1,2]
    @photoable = resource.singularize.classify.constantize.find(id)
  end
end
