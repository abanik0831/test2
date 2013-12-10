class AddAngelListToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :angellist_url, :string
  end
end
