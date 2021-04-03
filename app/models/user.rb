class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups, :through => :membership
  has_many :deliverables, :through => :assignment
  mount_uploader :avatar, AvatarUploader
end
