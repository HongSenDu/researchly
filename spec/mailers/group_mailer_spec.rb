require "rails_helper"

RSpec.describe GroupMailer, type: :mailer do
  describe "group_join" do
    group = Group.new(name: 'cool group')
    user = User.new(username: 'Carl', email: 'researchly995@gmail.com', password: '123456', password_confirmation: '123456')
    user2 = User.new(username: 'Naomi', email: 'researchly996@gmail.com', password: '123456', password_confirmation: '123456')
    Membership.new(user_id: '2', group_id: '1')
    let(:mail) { GroupMailer.group_join(user2, user, group).deliver! }

    it "renders the headers" do
      expect(mail.subject).to eq("Carl joined your Group!")
      expect(mail.to).to eq(["researchly996@gmail.com"])
      expect(mail.from).to eq(["researchly65@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include("Hello Naomi,")
      expect(mail.body.encoded).to include("User Carl has joined your cool group Group!")
    end
  end

  describe "group_leave" do
    group = Group.new(name: 'cool group')
    user = User.new(username: 'Carl', email: 'researchly995@gmail.com', password: '123456', password_confirmation: '123456')
    user2 = User.new(username: 'Naomi', email: 'researchly996@gmail.com', password: '123456', password_confirmation: '123456')
    Membership.new(user_id: '2', group_id: '1')
    let(:mail) { GroupMailer.group_leave(user2, user, group).deliver! }

    it "renders the headers" do
      expect(mail.subject).to eq("Carl has left your Group")
      expect(mail.to).to eq(["researchly996@gmail.com"])
      expect(mail.from).to eq(["researchly65@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include("Hello Naomi,")
      expect(mail.body.encoded).to include("User Carl has left your cool group Group")
    end
  end
end
