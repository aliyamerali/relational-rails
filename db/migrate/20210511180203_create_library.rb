class CreateLibrary < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.string :name
      t.integer :staff_count
      t.integer :member_count
      t.boolean :open

      t.timestamps
    end
  end
end
