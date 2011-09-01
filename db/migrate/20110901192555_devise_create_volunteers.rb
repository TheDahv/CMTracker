class DeviseCreateVolunteers < ActiveRecord::Migration
  def self.up
    create_table(:volunteers) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable

      t.string :first_name
      t.string :last_name
      t.boolean :admin
      t.references :classroom

      t.timestamps
    end

    add_index :volunteers, :email,                :unique => true
    add_index :volunteers, :reset_password_token, :unique => true
    # add_index :volunteers, :confirmation_token,   :unique => true
    # add_index :volunteers, :unlock_token,         :unique => true
    # add_index :volunteers, :authentication_token, :unique => true
  end

  def self.down
    drop_table :volunteers
  end
end
