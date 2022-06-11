class CreateInnercomments < ActiveRecord::Migration[6.1]
  def change
    create_table :innercomments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :inner, null: false, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
