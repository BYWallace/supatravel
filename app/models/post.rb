class Post < ActiveRecord::Base
  before_save :get_coordinates
  belongs_to :user

  # validates_associated :photos

  # validates :latitude, numericality: {greater_than_or_equal_to: -90, less_than_or_equal_to: 90}
  # validates :longitude, numericality: {greater_than_or_equal_to: -180, less_than_or_equal_to: 180}

  validates :title, presence: true
  validates :story, presence: true



  def get_coordinates
    loc = location.tr(" ", "+")

    response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{loc}")

    self.latitude = response["results"][0]["geometry"]["location"]["lat"].to_f

    self.longitude = response["results"][0]["geometry"]["location"]["lng"].to_f

    #binding.pry
  end



end
