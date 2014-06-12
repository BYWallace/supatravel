class Photo < ActiveRecord::Base
  belongs_to :user, dependent: :destroy

  has_attached_file :photo_image, :styles => { :medium => "500x700>", :thumb => "200x200>" }, :default_url => ""
  validates_attachment_content_type :photo_image, :content_type => /\Aimage\/.*\Z/
end
