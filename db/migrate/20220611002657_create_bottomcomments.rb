class CreateBottomcomments < ActiveRecord::Migration[6.1]
  def change
    create_table :bottomcomments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bottom, null: false, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
