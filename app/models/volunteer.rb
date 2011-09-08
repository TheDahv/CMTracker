class Volunteer < ActiveRecord::Base
  belongs_to :classroom

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :stretches => 10

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def to_s
    "#{ first_name } #{ last_name }"  
  end

  def is_admin?
    admin
  end
end
