class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :photos, dependent: :destroy
  validates_associated :posts

  validates :email, :encrypted_password, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
