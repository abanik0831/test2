class RemoveIndexFromAuthentication < ActiveRecord::Migration
  def change
    remove_column :authentications, :index, :string
  end
end
