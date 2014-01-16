class AddEmailForNewFollowerAndEmailForNewLikeAndEmailForNewCmntToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_for_new_follower, :boolean
    add_column :users, :email_for_new_like, :boolean
    add_column :users, :email_for_new_cmnt, :boolean
  end
end
