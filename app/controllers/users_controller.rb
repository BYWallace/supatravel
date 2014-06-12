class UsersController < ApplicationController

  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @hash = Gmaps4rails.build_markers(@posts) do |post, marker|
      @post = post
      marker.lat post.latitude
      marker.lng post.longitude
      marker.infowindow render_to_string(partial: "/layouts/info_window", locals: {post: post})
    end
  end

end
