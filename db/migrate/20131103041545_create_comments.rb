class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :cmtpost

      t.timestamps
    end
  end
end
