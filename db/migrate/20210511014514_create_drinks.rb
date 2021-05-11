class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.float :cost
      t.string :name
      t.integer :abv
      t.boolean :popular
      t.references :bartender, foreign_key: true

      t.timestamps
    end
  end
end
