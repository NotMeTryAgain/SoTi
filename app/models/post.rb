class Post < ActiveRecord::Base
  belongs_to :user

  validates :webseries_name, presence: true
  validates :link, presence: true
  validates :description, presence: true, length: { minimum: 5 }
end
