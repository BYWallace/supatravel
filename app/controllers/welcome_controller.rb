class WelcomeController < ApplicationController
  before_action :find_blog, only: [:show, :edit, :update, :destroy]

    def index
      @posts = Post.all
      @hash = Gmaps4rails.build_markers(@posts) do |post, marker|
        @post = post
        marker.lat post.latitude
        marker.lng post.longitude
        marker.infowindow render_to_string(:partial => "/welcome/info_window", :locals => { :object => post}).gsub(/\n/, '')
        marker.picture({
                    :url => "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
                    :width   => 36,
                    :height  => 36
        })
      end
    end

  private

    def find_blog
      @user = User.find(params[:id])
    end
end
