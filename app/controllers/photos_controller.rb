class PhotosController < ApplicationController
  before_action(:load_user, only: [:index, :new, :create, :show, :edit, :update, :destroy] )
  before_action :require_current_user, except: [:index, :show, :search]
  before_action(:load_photo, { only: [:edit, :update, :show, :destroy] })

  def index
    page_user = User.find_by(id: params[:user_id])
    @photos = page_user.photos.reverse
  end

  def new
  end

  def create
  end


  private

    def load_user
      return @user = User.find_by(id: params[:user_id])
    end

    def load_photo
    return @photo = Photo.find_by(id: params[:id])
    end

    def photo_params
      params.require(:photo).permit(:photo_image, :user_id)
    end

    def require_current_user
      if !current_user?(@user)
        redirect_to root_path
      end
    end

end
