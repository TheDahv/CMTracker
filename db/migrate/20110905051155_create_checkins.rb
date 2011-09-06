class CreateCheckins < ActiveRecord::Migration
  def self.up
    create_table :checkins do |t|
      t.datetime :checkin_time
      t.datetime :checkout_time
      t.integer :pager
      t.references :volunteer
      t.references :child
      t.references :classroom
      t.references :service

      t.timestamps
    end
  end

  def self.down
    drop_table :checkins
  end
end
