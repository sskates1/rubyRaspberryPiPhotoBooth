require 'gphoto2'

class PhotosController < ApplicationController
  def index
    if GPhoto2::Camera.all.count > 0
      @camera = GPhoto2::Camera.first
    else
      @camera = nil
    end
  end

  def create
    camera = GPhoto2::Camera.first
    file = camera.capture
    @photo = Photo.new(photo_params)
    @photo.image = file
    @photo.save
    render action: 'index'
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end
end
