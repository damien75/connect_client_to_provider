class Provider < ActiveRecord::Base
  has_many :specialties
  has_one :status

  validates :name , presence: true , uniqueness: true , length: {minimum: 5}
  validates :status_id , presence: true
  validates :specialty_id , presence: true

end
