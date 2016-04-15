class User < ActiveRecord::Base # :nodoc:
  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username, presence: true
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :votes, dependent: :destroy

  def admin?
    role == "admin"
  end

  def voted?(id)
    votes.where(review_id: id).exists?
  end
end
