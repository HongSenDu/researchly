require 'rails_helper'

RSpec.describe "messages/edit", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      user_id: 1,
      recipient_id: 1,
      group_id: 1,
      subject: "MyString",
      body: "MyString",
      read: false,
      show_user: false,
      show_recipient: false
    ))
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(@message), "post" do

      assert_select "input[name=?]", "message[user_id]"

      assert_select "input[name=?]", "message[recipient_id]"

      assert_select "input[name=?]", "message[group_id]"

      assert_select "input[name=?]", "message[subject]"

      assert_select "input[name=?]", "message[body]"

      assert_select "input[name=?]", "message[read]"

      assert_select "input[name=?]", "message[show_user]"

      assert_select "input[name=?]", "message[show_recipient]"
    end
  end
end
