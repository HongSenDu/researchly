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
def find_group
    @group || Group.where(:name => @temp[:name]).first
end

def join_group(group_name)
    puts(group_name)
    visit '/groups/'
    fill_in "search", :with => group_name
    click_button "Search"
    click_button "Join Group"
end

def leave_group
    visit '/groups/show/'
    click_button "Leave Group"
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
#Given /the following group exist/ do |groups_table|
#    groups_table.hashes.each do |group|
#        Group.create group
#    end
#end
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
#Given /^I exist as a user$/ do
#    create_user
#end

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
### THEN ###

#Then /^I should see a successful sign up message$/ do
#    expect(page).to have_content /Successfully Joined Group./.i
#end

Then /^I should see a left group message$/ do
    expect(page).to have_content /You have left Group/.i
end

### When ###

When /^I leave a group$/ do
    leave_group
end

#When /^I return to the site/ do
#    visit '/groups/index.html'
#end

When /^I sign up with {string}/ do |string|
    join_group(string)
  end

When /I click on Join Group for group (.+)/ do |num|
    find("a[href='/groups/#{num}/join_group']").click
end

