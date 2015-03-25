class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	
		t.string :title
		
		t.text   :body
		
		t.boolean(:published, {null: false, default: true})
		
		t.references :user
			
      t.timestamps null: false
    end
  end
end
