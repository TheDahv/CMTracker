class AddNotesToChildren < ActiveRecord::Migration
  def self.up
    add_column :children, :notes, :text
  end

  def self.down
    remove_column :children, :notes
  end
end
