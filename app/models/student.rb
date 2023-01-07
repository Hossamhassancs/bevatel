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

  def self.reorder(school, student)
    id = student.id
    students_to_edit_order = school.students.where("id > ?" , id)

    students_to_edit_order.each do |student|
      old_order = student.order
      new_order = student.order - 1
      student.update(order: new_order)
    end

    TaskConfirmationMailer.task_confirmation_email.deliver_now
  end
  
end
