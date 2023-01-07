class School < ApplicationRecord

  acts_as_paranoid
  
  has_many :students, dependent: :destroy

  validates_presence_of :name
end
