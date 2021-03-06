class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :pw_digest
      t.references :posts, index: true
      t.integer :role, default: 2

      t.timestamps null: false
    end
    add_foreign_key :users, :posts
  end
end
