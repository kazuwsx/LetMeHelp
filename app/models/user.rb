class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :chat
  has_many :request
  has_one :profile, dependent: :destroy 
  mount_uploader :image, ImageUploader
end
