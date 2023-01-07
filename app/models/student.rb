class Student < ApplicationRecord

  acts_as_paranoid

  belongs_to :school
  
  validates_presence_of :name
end
