class Review < ActiveRecord::Base
  def self.ratings
    [
      [1, "1 (Hated It!)"],
      [2, "2 (Kind of terrible.)"],
      [3, "3 (Meh.)"],
      [4, "4 (Pretty good)"],
      [5, "5 (Best thing ever)"]
    ]
  end
  belongs_to :user
  belongs_to :post

  validates_presence_of :rating, { message: "must be provided!" }
  validates_uniqueness_of :user, { scope: :post }
end
