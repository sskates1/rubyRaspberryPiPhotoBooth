class PhotoController < ApplicationController
  def index
    @camera = GPhoto2::Camera.first

  end

  def create
    camera = GPhoto2::Camera.first
    file = camera.capture
    @photo = Photo.new(photo_params)
    @photo.image = file
    @photo.save
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end
end
