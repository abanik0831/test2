class AddProfileidToProfilePic < ActiveRecord::Migration
  def change
    add_column :profile_pics, :profile_id, :integer
  end
end
