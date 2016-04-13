class User < ActiveRecord::Base # :nodoc:
  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username, presence: true
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :reviews

  def admin?
    role == "admin"
  end
end
