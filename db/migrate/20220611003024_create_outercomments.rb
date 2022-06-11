class CreateOutercomments < ActiveRecord::Migration[6.1]
  def change
    create_table :outercomments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :outer, null: false, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
