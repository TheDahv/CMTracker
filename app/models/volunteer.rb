class Volunteer < ActiveRecord::Base
  belongs_to :classroom

  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :stretches => 10

  # Device accessible attributes
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def to_s
    "#{ first_name } #{ last_name }"  
  end

  def admin_label
    to_s
  end

  def is_admin?
    admin
  end
end
# == Schema Information
#
# Table name: volunteers
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  admin                  :boolean
#  classroom_id           :integer
#  created_at             :datetime
#  updated_at             :datetime
#

