class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :position
      t.text :biography
      t.string :facebook_url
      t.string :instagram_url
      t.string :twitter_url
      t.string :youtube_url
      t.attachment :picture

      t.timestamps null: false
    end
  end
end
