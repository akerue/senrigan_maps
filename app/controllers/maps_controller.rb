class MapsController < ApplicationController
  def index
  end

  def fetch_photo
    @photo = generate_photo(Photo.find_by(x: params[:x], y: params[:y], z: params[:z], theta: params[:theta]))
    render json: @photo
  end

  private
  def generate_photo(photo)
    unless photo
      photo = Photo.new(x: nil, y: nil, z: nil, theta: nil, path: nil)
    end
    photo
  end
end
