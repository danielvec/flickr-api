class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new "9e85098b173e5ceef56440dce5397b3f", "f34789e4fb6b6bbe"
    if !params[:username].nil?
      @username = params[:username]
      user   = flickr.people.findByUsername :username => @username

      user_id     = user.id
      @photos   = flickr.people.getPhotos :user_id => user_id
      @photo_count = @photos.length
    end
  end
end
