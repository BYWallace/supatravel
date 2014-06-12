class PostsController < ApplicationController
  before_action :find_user

  def index
   @posts = Post.all
    @hash = Gmaps4rails.build_markers(@posts) do |post, marker|
      @post = post
      marker.lat post.latitude
      marker.lng post.longitude
      marker.infowindow render_to_string(partial: "/layouts/info_window", locals: {post: post})
    end
  end

  def show
    @current_post = Post.find(params[:id])
    @hash = Gmaps4rails.build_markers(@current_post) do |post, marker|
        @post = post
        marker.lat post.latitude
        marker.lng post.longitude
        marker.infowindow render_to_string(partial: "/layouts/info_window", locals: {post: post})
      end
  end

  def new
    @post = Post.new
  end

  def create
    #binding.pry
    @post = current_user.posts.create(post_params)
    redirect_to user_post_path(current_user, @post)

      # if @post.save
      #   redirect_to user_post_path(current_user, @post)
      # else
      #   render :new
      # end
  end

  private

    def find_user
      @user = User.find(params[:user_id])
    end

    def post_params
      params.require(:post).permit(
        :title,
        :story,
        :location,
        :photo_ids => []
      )
    end

end
