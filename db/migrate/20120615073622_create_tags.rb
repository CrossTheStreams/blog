class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :keyword
      t.integer :color, :default => 333333
      t.timestamps
    end
  end
end
