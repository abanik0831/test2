class AddProfilepicidToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :profilepicid, :integer
  end
end
