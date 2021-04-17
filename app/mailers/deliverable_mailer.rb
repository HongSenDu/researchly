class DeliverableMailer < ApplicationMailer
default from: "researchly65@gmail.com"

  def deliverable_complete(user, deliverable)
    @greeting = "Hi"
    @user = user

    mail to: user.email, subject: "Deliverable Complete"
  end
end
