class CreateBottoms < ActiveRecord::Migration[6.1]
  def change
    create_table :bottoms do |t|
      t.string :name
      t.string :size
      t.integer :color
      t.integer :waist
      t.integer :hip
      t.integer :inseam
      t.integer :maxtemperature
      t.integer :mixtemperature

      t.timestamps
    end
  end
end
