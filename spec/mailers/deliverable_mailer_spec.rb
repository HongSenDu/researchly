require "rails_helper"

RSpec.describe DeliverableMailer, type: :mailer do
  describe "deliverable_complete" do
    let(:mail) { DeliverableMailer.deliverable_complete }

    it "renders the headers" do
      expect(mail.subject).to eq("Deliverable complete")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
