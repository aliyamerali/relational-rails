class CreateBartenders < ActiveRecord::Migration[5.2]
  def change
    create_table :bartenders do |t|
      t.string :name
      t.integer :age
      t.boolean :on_vacation
      t.string :city

      t.timestamps
    end
  end
end
