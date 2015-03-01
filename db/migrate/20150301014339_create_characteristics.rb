class CreateCharacteristics < ActiveRecord::Migration
  def change
    create_table :characteristics do |t|
      t.references :skill, index: true
      t.references :profile, index: true

      t.timestamps null: false
    end
    add_foreign_key :characteristics, :skills
    add_foreign_key :characteristics, :profiles
  end
end
