class Tags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :post_id
      t.string  :keyword 
    end 
  end
end
