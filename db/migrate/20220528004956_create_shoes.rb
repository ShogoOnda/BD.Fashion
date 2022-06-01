class CreateShoes < ActiveRecord::Migration[6.1]
  def change
    create_table :shoes do |t|
      t.string :name
      t.string :size
      t.integer :color
      t.integer :maxtemperature
      t.integer :mixtemperature

      t.timestamps
    end
  end
end
