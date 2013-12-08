class CreateProfilePics < ActiveRecord::Migration
  def change
    create_table :profile_pics do |t|
      t.string :image

      t.timestamps
    end
  end
end
