class RemoveAreaFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :area, :string
  end
end
