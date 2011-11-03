class ConvertStringToText < ActiveRecord::Migration
  def up
    change_column :notes, :title, :text
    change_column :notes, :description, :text
  end

  def down
    change_column :notes, :title, :string
    change_column :notes, :description, :text
  end
end
