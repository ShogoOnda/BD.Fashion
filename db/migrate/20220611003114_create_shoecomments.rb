class CreateShoecomments < ActiveRecord::Migration[6.1]
  def change
    create_table :shoecomments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shoe, null: false, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
