def create_user
    @temp_user||= { :email => "example@example.com",
    :password => "changeme", :password_confirmation => "changeme" }
    @user = FactoryBot.create(:user, @temp_user)
end

def create_group
    @temp ||={
        :name => "test group",
        :description=> "this is a test group"
    }
end

def join_group(group_name)
    puts(group_name)
    visit '/groups/'
    fill_in "search", :with => group_name
    click_button "Search"
    click_button "Join Group"
end
def delete_group
    @group ||= Group.where(:name => @temp["name"]).first
    @group.destroy unless @group.nil?
end

def sign_in
    visit '/users/sign_in'
    fill_in "user_email", :with => @visitor[:email]
    fill_in "user_password", :with => @visitor[:password]
    click_button "Log in"
end
### Given ###

Given /the following users exist/ do |users_table|
    users_table.hashes.each do |user|
        User.create user
    end
end

Given /the following memberships exist/ do |memeberships_table|
    memeberships_table.hashes.each do |membership|
        Membership.create membership
    end
end

Given /^I am a group member$/ do
    create_user
    create_group
    join_group
end

Given /^there are groups added to the database$/ do
    create_group
end

Given /^I am a member of a group$/ do
    create_group
    join_group
end

