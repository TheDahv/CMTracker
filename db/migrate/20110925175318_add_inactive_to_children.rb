class AddInactiveToChildren < ActiveRecord::Migration
  def self.up
    add_column :children, :inactive, :boolean, :default => 0
  end

  def self.down
    remove_column :children, :inactive
  end
end
