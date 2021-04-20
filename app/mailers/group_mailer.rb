class GroupMailer < ApplicationMailer
 default from: "researchly65@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.group_mailer.group_join.subject
  #
  def group_join(user, new_member, group)
    @greeting = "Hi"
    @user = user
    @new_member = new_member
    @group = group

    mail to: user.email, subject: "#{new_member.username} joined your Group!"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.group_mailer.group_leave.subject
  #
  def group_leave(user, new_member, group)
    @greeting = "Hi"
    @user = user
    @new_member = new_member
    @group = group

    mail to: user.email, subject: "#{new_member.username} has left your Group"
  end
end
