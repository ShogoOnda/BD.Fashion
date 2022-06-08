class CreateInners < ActiveRecord::Migration[6.1]
  def change
    create_table :inners do |t|
      t.string :name
      t.string :size
      t.integer :color
      t.integer :shoulder
      t.integer :width
      t.integer :length
      t.integer :sleeve
      t.integer :maxtemperature
      t.integer :mixtemperature

      t.timestamps
    end
  end
end
