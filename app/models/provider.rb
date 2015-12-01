class Provider < ActiveRecord::Base
  has_many :specialties
  has_one :status

  validates :name , presence: true , uniqueness: true
  validates :status , presence: true
  validates :specialty , presence: true

end
