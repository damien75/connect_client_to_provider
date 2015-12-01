class Specialty < ActiveRecord::Base
  validates :title , presence: true , uniqueness: true
  validates :description , presence: true
end
