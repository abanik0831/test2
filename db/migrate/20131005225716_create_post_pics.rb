class CreatePostPics < ActiveRecord::Migration
  def change
    create_table :post_pics do |t|
      t.integer :post_id
      t.string :picture

      t.timestamps
    end
  end
end
