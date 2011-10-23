class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :count
      t.string :slug
    end
    
    add_index :tags, :slug, :unique => true
  end
end
