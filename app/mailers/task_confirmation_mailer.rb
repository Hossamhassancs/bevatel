class TaskConfirmationMailer < ApplicationMailer
    default from: 'hossamhassan.csd@gmail.com'

    def task_confirmation_email
        @message="your task has been finished"
        mail(to: "bevatel@gmail.com" , subject: "task confirmation" )
    end
end
