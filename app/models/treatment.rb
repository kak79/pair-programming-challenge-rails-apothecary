class Treatment < ApplicationRecord

  validates_presence_of :name, :description

  has_many :prescriptions
  has_many :users, through: :prescriptions


end
