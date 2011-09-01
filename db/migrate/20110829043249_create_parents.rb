class CreateParents < ActiveRecord::Migration
  def self.up
    create_table :parents do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :parents
  end
end
