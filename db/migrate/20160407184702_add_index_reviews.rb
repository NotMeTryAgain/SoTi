class AddIndexReviews < ActiveRecord::Migration
  def change
    add_index :reviews, [:post_id, :user_id], unique: true
  end
end
