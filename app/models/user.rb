class User < ApplicationRecord

  validates :username, presence: true, uniqueness: true
  has_secure_password
  
  has_many :prescriptions
  has_many :treatments, through: :prescriptions 

end
