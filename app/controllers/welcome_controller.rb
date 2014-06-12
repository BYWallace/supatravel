class WelcomeController < ApplicationController
  before_action :find_blog, only: [:show, :edit, :update, :destroy]

    def index
      @posts = Post.all
      @hash = Gmaps4rails.build_markers(@posts) do |post, marker|
        @post = post
        marker.lat post.latitude
        marker.lng post.longitude
        marker.infowindow render_to_string(partial: "/layouts/info_window", locals: {post: post})
      end
    end

  private

    def find_blog
      @user = User.find(params[:id])
    end
end
