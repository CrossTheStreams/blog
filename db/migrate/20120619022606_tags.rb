class Tags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string  :keyword 
    end 
  end
end
