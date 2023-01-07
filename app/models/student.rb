class Student < ApplicationRecord

  acts_as_paranoid
  has_secure_password

  #validations
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  #relations
  belongs_to :school

  #callbacks
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
