class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string "webseries_name", null: false
      t.string "link", null: false
      t.text "description", null: false
      t.belongs_to :user
    end
  end
end
