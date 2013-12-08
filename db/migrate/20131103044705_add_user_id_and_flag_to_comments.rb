class AddUserIdAndFlagToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer
    add_column :comments, :comment_visibility, :boolean, :default => true
  end
end
