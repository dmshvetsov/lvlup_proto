class CreateLvlups < ActiveRecord::Migration
  def change
    create_table :lvlups do |t|
      t.string :description
      t.references :characteristic, index: true

      t.timestamps null: false
    end
    add_foreign_key :lvlups, :characteristics
  end
end
