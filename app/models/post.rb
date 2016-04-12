class Post < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  def self.search(query)
    where("webseries_name like ?", "%#{query}%") 
  end

  def name
    webseries_name
  end

  validates :webseries_name, presence: true
  validates :link, presence: true
  validates :description, presence: true, length: { minimum: 5 }
end
