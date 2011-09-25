class AddFieldsToParents < ActiveRecord::Migration
  def self.up
    add_column :parents, :inactive, :boolean, :default => false
    add_column :parents, :onthecity, :boolean
  end

  def self.down
    remove_column :parents, :onthecity
    remove_column :parents, :inactive
  end
end
