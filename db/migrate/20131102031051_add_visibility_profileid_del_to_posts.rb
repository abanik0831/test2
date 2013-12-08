class AddVisibilityProfileidDelToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :visibility, :boolean, :default => true
    add_column :posts, :profileid_del, :integer
  end
end
