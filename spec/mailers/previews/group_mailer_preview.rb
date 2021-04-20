# Preview all emails at http://localhost:3000/rails/mailers/group_mailer
class GroupMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/group_mailer/group_join
  def group_join
    GroupMailer.group_join
  end

  # Preview this email at http://localhost:3000/rails/mailers/group_mailer/group_leave
  def group_leave
    GroupMailer.group_leave
  end

end
