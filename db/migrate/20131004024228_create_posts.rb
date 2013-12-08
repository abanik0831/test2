class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :post
      t.integer :profile_id

      t.timestamps
    end
  end
end
