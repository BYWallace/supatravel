class Photo < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :posts

  has_attached_file :photo_image, :styles => { :medium => "500x700>", :thumb => "200x200>" }, :default_url => ""
  validates_attachment_content_type :photo_image, :content_type => /\Aimage\/.*\Z/

  def paperclip_url
    image_tag @photo.photo_image_file_name(:medium)
  end
end
