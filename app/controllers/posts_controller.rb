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
  end

  private

    def find_blog
      @user = User.find(params[:blog_id])
    end

end
