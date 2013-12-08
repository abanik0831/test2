class AddPostidToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :post_id, :integer
  end
end
