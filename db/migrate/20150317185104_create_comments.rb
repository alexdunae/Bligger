class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
		t.belongs_to :post, null: false
		
		t.string :name, null: false, default: 'Coward'
		
		t.text :body

      t.timestamps null: false
    end
  end
end
