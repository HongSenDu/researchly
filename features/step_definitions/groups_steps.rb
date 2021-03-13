def create_user
    @temp_user||= { :email => "example@example.com",
    :password => "changeme", :password_confirmation => "changeme" }
    @user = FactoryBot.create(:user, @temp_user)
def create_group
    @temp ||={
        :name => "test group",
        :description=> "this is a test group"
    }
def find_group
    @group || Group.where(:name => @temp[:name]).first
end

def join_group
    delete_group
    visit '/groups/index'
    fill_in "groups_name", :with => @temp[:name]
    click_button "Join Group"

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
Given /^I am logged in$/ do
    create_user
    sign_in
end
Given /^I exist as a user$/ do
    create_user
end
Given /^I am a group member$/ do
    create_user
    create_group
    join_group
end
Given /^there are groups added to the database$/ do
    create_group
end
### THEN ###
Then /^I should see a successful sign up message$/ do
    expect(page).to have_content /Successfully Joined Group./.i
end
Then /^I should see a left group message$/ do
    expect(page).to have_content /You have left Group/.i
end
Then /^I should no longer be a part of the group$/ do
    expect(page).not_to have_content //.in
end
Then /^I should see a not authorized message$/do
end
Then /^I should see 
### When ###
When /^I leave group$/ do
    leave_group
end
When /^I return to the site/ do
    visit '/groups/index.html'
end
When /^I am authorized to sign up with a valid group$/ do
end
When /^I am not authorized to sign up with a valid group$/ do
end

Scenario: Not Authorized User joins a valid group
When I am not authorized to sign up with a valid group
Then I should see a not authorized message

Scenario: User joins an invalid group
When I try to join an invalid group
Then I should see an invalid group message
