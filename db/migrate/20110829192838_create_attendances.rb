class CreateAttendances < ActiveRecord::Migration
  def self.up
    create_table :attendances do |t|
      t.integer :service_id
      t.integer :classroom_id
      t.integer :child_id
      t.timestamps
    end
  end

  def self.down
    drop_table :attendances
  end
end
