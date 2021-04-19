require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        user_id: 2,
        recipient_id: 3,
        group_id: 4,
        subject: "Subject",
        body: "Body",
        read: false,
        show_user: false,
        show_recipient: false
      ),
      Message.create!(
        user_id: 2,
        recipient_id: 3,
        group_id: 4,
        subject: "Subject",
        body: "Body",
        read: false,
        show_user: false,
        show_recipient: false
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: "Subject".to_s, count: 2
    assert_select "tr>td", text: "Body".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
