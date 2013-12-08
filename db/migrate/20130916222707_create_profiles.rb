class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :f_name
      t.string :l_name
      t.string :area
      t.string :skills
      t.string :fb_url
      t.string :linkedin_url
      t.string :meetup_url
      t.string :twitter_url

      t.timestamps
    end
  end
end
