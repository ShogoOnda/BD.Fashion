class CreateOnedays < ActiveRecord::Migration[6.1]
  def change
    create_table :onedays do |t|

      t.string :title
      t.text :review
      t.datetime :start_time
      t.integer :user_id

      t.timestamps
    end
  end
end
