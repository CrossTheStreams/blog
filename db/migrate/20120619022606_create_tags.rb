class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :post_id
      t.integer :keyword_id
      t.timestamps 
    end 
  end
end
