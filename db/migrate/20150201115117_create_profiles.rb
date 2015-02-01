class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :uid
      t.string :nickname
      t.string :image
      t.string :url
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps null: false
    end
  end
end
