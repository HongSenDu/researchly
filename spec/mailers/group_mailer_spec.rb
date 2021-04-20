require "rails_helper"

RSpec.describe GroupMailer, type: :mailer do
  describe "group_join" do
    let(:mail) { GroupMailer.group_join }

    it "renders the headers" do
      expect(mail.subject).to eq("Group join")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "group_leave" do
    let(:mail) { GroupMailer.group_leave }

    it "renders the headers" do
      expect(mail.subject).to eq("Group leave")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
