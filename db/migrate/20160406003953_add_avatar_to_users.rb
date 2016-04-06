class AddAvatarToUsers < ActiveRecord::Migration # :nodoc:
  def change
    add_column :users, :avatar, :string
  end
end
