class RemoveProfileIdFromLikes < ActiveRecord::Migration
  def change
    remove_column :likes, :profile_id, :integer
  end
end
