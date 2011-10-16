class AddVisitorToParents < ActiveRecord::Migration
  def self.up
    add_column :parents, :visitor, :boolean, :default => false
  end

  def self.down
    remove_column :parents, :visitor
  end
end
