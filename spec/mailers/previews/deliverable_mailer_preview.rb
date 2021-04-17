# Preview all emails at http://localhost:3000/rails/mailers/deliverable_mailer
class DeliverableMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/deliverable_mailer/deliverable_complete
  def deliverable_complete
    DeliverableMailer.deliverable_complete
  end

end
