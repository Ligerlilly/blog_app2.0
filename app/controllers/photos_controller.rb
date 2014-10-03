class PhotosController < ApplicationController
  before_action :load_photoable
  before_action :find_entry
  before_action :is_user_admin, except: :show
  
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
      redirect_to edit_entry_path(@photo.photoable_id)
    else
      redirect_to new_entry_photo_path(@entry), alert: "You must attach image."
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    entry_id =  @photo.photoable_id
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to edit_entry_path(entry_id) }
      format.json { head :no_content }
    end
  end


  private
  def find_entry
    @entry = Entry.find(params[:entry_id])
  end
  
  def photo_params
    params.require(:photo).permit(:caption, :image, :entry_id)
  end

  def load_photoable
    resource, id = request.path.split('/')[1,2]
    @photoable = resource.singularize.classify.constantize.find(id)
  end
end
