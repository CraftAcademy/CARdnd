class User < ApplicationRecord
  has_many :automobile
  has_many :rental
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name, :address, :driving_age, :age
end
