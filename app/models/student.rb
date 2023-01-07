class Student < ApplicationRecord

  acts_as_paranoid

  belongs_to :school
  validates_presence_of :name 
  after_create :set_order


  def set_order
    school = self.school
    last_id = school.students.last.order || 0
    self.update(order: last_id+1)
  end
  
end
