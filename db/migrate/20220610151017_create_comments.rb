class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :outer, null: false, foreign_key: true
      t.references :inner, null: false, foreign_key: true
      t.references :bottom, null: false, foreign_key: true
      t.references :shoe, null: false, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
