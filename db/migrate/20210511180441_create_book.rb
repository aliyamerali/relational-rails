class CreateBook < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :publish_year
      t.boolean :available
      t.references :library, foreign_key: true

      t.timestamps
    end
  end
end
