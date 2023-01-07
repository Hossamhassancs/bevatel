require "rails_helper"

RSpec.describe TaskConfirmationMailer, type: :mailer do
  let(:mail) { TaskConfirmationMailer.task_confirmation_email }

  describe '#send task confirmation' do
    it 'renders the subject' do
      expect(mail.subject).to eql('task confirmation')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql(["bevatel@gmail.com"])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(["hossamhassan.csd@gmail.com"])
    end


  end
end
