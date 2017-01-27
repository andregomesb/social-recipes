class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.references :cuisine, foreign_key: true
      t.references :meal, foreign_key: true
      t.integer :portion
      t.integer :preparation_time
      t.integer :difficulty
      t.text :ingredients
      t.text :instructions

      t.timestamps
    end
  end
end
