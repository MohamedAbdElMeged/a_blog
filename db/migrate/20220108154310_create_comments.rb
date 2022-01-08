class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.references :post, null: false, foreign_key: true
      t.integer :user

      t.timestamps
    end
  end
end
