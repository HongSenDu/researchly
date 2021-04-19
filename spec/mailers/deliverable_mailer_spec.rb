require "rails_helper"

RSpec.describe DeliverableMailer, type: :mailer do
  describe "deliverable_complete" do
    group = Group.new(name: 'cool group')
    project = Project.new(name: 'cool project', group_id: '1')
    user = User.new(username: 'Carl', email: 'researchly995@gmail.com', password: '123456', password_confirmation: '123456')
    deliverable = Deliverable.new(name: 'Deliverable', project_id: '1')
    let(:mail) { DeliverableMailer.deliverable_complete(user, deliverable).deliver! }

    it "renders the headers" do
      expect(mail.subject).to eq("Deliverable Complete")
      expect(mail.to).to eq(["researchly995@gmail.com"])
      expect(mail.from).to eq(["researchly65@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include("Your Deliverable is complete!")
    end
  end

end
