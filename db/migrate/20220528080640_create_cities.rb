class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.integer :address
      t.integer :destination
      t.string :cityname

      t.timestamps
    end
  end
end
