class AddProfileIdToPostPics < ActiveRecord::Migration
  def change
    add_column :post_pics, :profile_id, :integer
  end
end
