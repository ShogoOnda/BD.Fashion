class CreateShoes < ActiveRecord::Migration[6.1]
  def change
    create_table :shoes do |t|
      t.string :name
      t.string :size
      t.integer :color
      t.string :brand
      t.text :review
      t.integer:status, null: false, default: 0
      t.integer :user_id
      t.timestamps
    end
  end
end
