class PhotosController < ApplicationController
  def new
    @photo = Photo.new(entry_id: params[:entry_id])
  end
  
  def show
    @photo = Photo.find(params[:id])
  end
 
  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:notice] = "Successfully created photo"
      redirect_to edit_entry_path(@photo.entry)
    else
      render action: 'new'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    entry_id = @photo.entry_id
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to edit_entry_path(entry_id) }
      format.json { head :no_content }
    end
  end

 
  private
  def photo_params
    params.require(:photo).permit(:caption, :image, :entry_id)
  end
end
