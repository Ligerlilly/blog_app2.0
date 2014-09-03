class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end
  
  def edit
    @entry = Entry.find(params[:id])
  end
  
  def show
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def create
    @entry = Entry.new(entry_params)
    
    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry has been created.' }
        format.json { head :no_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def new
    @entry = Entry.new
  end
  
  private
  def entry_params
    params.require(:entry).permit(:title, :content, :photo)
  end
     
end
