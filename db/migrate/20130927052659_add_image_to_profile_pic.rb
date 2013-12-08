class AddImageToProfilePic < ActiveRecord::Migration
  def change
    add_column :profile_pics, :picture, :string
  end
end
