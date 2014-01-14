class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.boolean :email_for_new_follower
      t.boolean :email_for_new_like
      t.boolean :email_for_new_cmnt
      t.string :user_id

      t.timestamps
    end
  end
end
