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

def sign_up
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
    
end

