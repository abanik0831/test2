class RemoveCreateFromAuthentication < ActiveRecord::Migration
  def change
    remove_column :authentications, :create, :string
  end
end
