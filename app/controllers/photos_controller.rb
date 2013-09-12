class PhotosController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  # GET /photos
  # GET /photos.json
  def index
    if params[:approved] == "true"
      @photos = Photo.where("approved = ?", true)
    else
      @instagram_photos = Instagram.tag_recent_media('awesome', {count: 30})
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end

  def approve
    approved_photos = params[:approved_photos]
    instagram_photos = params[:photos]
    instagram_photos.each do |instagram_photo|
      existing_photo = Photo.find_by_instagram_id instagram_photo[:instagram_id]
      if approved_photos.include? instagram_photo[:instagram_id] and !existing_photo
        photo = Photo.new(
          instagram_id: instagram_photo[:instagram_id],
          standard_url: instagram_photo[:standard_url],
          thumb_url: instagram_photo[:thumb_url],
          approved: true
        )
        photo.save
      elsif existing_photo and !(approved_photos.include? existing_photo.instagram_id)
        existing_photo.destroy
      end
    end
    respond_to do |format|
      format.html { redirect_to photos_path(approved: true) }
    end
  end
end
