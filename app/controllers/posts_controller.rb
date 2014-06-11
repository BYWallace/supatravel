class PostsController < ApplicationController
  before_action :find_blog, only: [:show, :edit, :update, :destroy]


  private

    def find_blog
      @user = User.find(params[:id])
    end

end
