class CreateFeaturesTable < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name
      t.boolean :active, :default => false 
    end
    Feature.create(:name => "staging_on", :active => "true")
  end
end
