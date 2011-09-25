class AddNotesToParents < ActiveRecord::Migration
  def self.up
    add_column :parents, :notes, :text
  end

  def self.down
    remove_column :parents, :notes
  end
end
