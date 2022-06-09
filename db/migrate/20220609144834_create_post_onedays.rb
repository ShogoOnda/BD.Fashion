class CreatePostOnedays < ActiveRecord::Migration[6.1]
  def change
    create_table :post_onedays do |t|
      t.references :outer, foreign_key: true
      t.references :inner, foreign_key: true
      t.references :bottom, foreign_key: true
      t.references :shoe, foreign_key: true
      t.references :oneday, null: false, foreign_key: true
      t.timestamps
    end
  end
end
