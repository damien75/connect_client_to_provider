class Provider < ActiveRecord::Base
  has_many :specialties

  validates :company , presence: true , uniqueness: true
  validates :status , presence: true
  validates :specialty , presence: true

end
