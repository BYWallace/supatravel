class Post < ActiveRecord::Base
  belongs_to :user
  has_many :photos, dependent: :destroy
  validates_associated :photos

  validates :latitude, numericality: {greater_than_or_equal_to: -75}
  validates :latitude, numericality: {less_than_or_equal_to: 75}
  validates :longitude, numericality: {greater_than_or_equal_to: -175}
  validates :longitude, numericality: {less_than_or_equal_to: 175}

  validates :title, :story, presence: true
end
