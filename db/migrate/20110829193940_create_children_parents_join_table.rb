class CreateChildrenParentsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :children_parents, :id => false do |t|
      t.integer :child_id
      t.integer :parent_id
    end
  end

  def self.down
    drop_table :children_parents
  end
end
