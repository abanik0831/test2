class AddTypeToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :type, :string
  end
end
