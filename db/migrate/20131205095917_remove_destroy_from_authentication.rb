class RemoveDestroyFromAuthentication < ActiveRecord::Migration
  def change
    remove_column :authentications, :destroy, :string
  end
end
