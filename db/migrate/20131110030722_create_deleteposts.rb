class CreateDeleteposts < ActiveRecord::Migration
  def change
    create_table :deleteposts do |t|
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
