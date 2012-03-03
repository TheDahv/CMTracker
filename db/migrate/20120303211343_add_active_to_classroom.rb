class AddActiveToClassroom < ActiveRecord::Migration
  def self.up
    add_column :classrooms, :active, :boolean
  end

  def self.down
    remove_column :classrooms, :active
  end
end
