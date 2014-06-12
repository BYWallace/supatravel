class PostsController < ApplicationController
  before_action :find_user

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
    @photos = Photo.where(user: current_user)
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_post_path(current_user, @post)
    else
      redirect_to user_post_path(current_user, @post)
    end
  end

  def destroy
    @post = @user.posts.find(params[:id])
    @post.destroy
    redirect_to user_path(@user)
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
