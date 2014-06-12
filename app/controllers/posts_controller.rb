class PostsController < ApplicationController
  before_action :find_blog

  def index
  end

  def show
    @posts = @user.posts.all
    @hash = Gmaps4rails.build_markers(@posts) do |post, marker|
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
    @post = current_user.posts.build(post_params)
    if @post.save

      @post.photos.create()

      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end

  private

    def find_blog
      @user = User.find(params[:user_id])
    end

    def post_params
      params.require(:post).permit(
        :title,
        :story,
        :location
      )
    end

    def photo_params
      params.require(:post).permit(
        :title,
      )
    end
end
