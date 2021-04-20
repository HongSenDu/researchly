class DeliverableMailer < ApplicationMailer
default from: "researchly65@gmail.com"

  def deliverable_complete(user, deliverable)
    @greeting = "Hi"
    @user = user
    @deliverable = deliverable

    mail to: user.email, subject: "Deliverable Complete"
  end

  def deliverable_assign(user, deliverable)
    @greeting = "Hi"
    @user = user
    @deliverable = deliverable

    mail to: user.email, subject: "You've been assigned to a Deliverable"
  end

  def deliverable_unassign(user, deliverable)
    @greeting = "Hi"
    @user = user
    @deliverable = deliverable

    mail to: user.email, subject: "You've been unassigned from a Deliverable"
  end

end
