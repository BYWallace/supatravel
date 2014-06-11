class PostsController < ApplicationController
  before_action :find_blog

  def index
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
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

end
