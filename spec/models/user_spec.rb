require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'handle email address requirement' do

    before do
      @attr = { :email => "example@example.com",
          :password => "changeme", :password_confirmation => "changeme" }
    end
  
    it "should create a new instance given a valid attribute" do
      User.create!(@attr)
    end

    
    it "should require an email address" do
      no_email_user = User.new(@attr.merge(:email => ""))
      expect(no_email_user).to_not be_valid
    end 

    it "should accept valid email addresses" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
        valid_email_user = User.new(@attr.merge(:email => address))
        expect(valid_email_user).to be_valid
      end
    end

    it "should reject duplicate email addresses" do
      User.create!(@attr)
      user_with_duplicate_email = User.new(@attr)
      expect(user_with_duplicate_email).to_not be_valid
    end

    it "should reject email addresses identical up to case" do
      upcased_email = @attr[:email].upcase
      User.create!(@attr.merge(:email => upcased_email))
      user_with_duplicate_email = User.new(@attr)
      expect(user_with_duplicate_email).to_not be_valid
    end
  end 

  describe "passwords" do

    before do
      @user = FactoryBot.create(:user, { :email => "example@example.com",
              :password => "changeme", :password_confirmation => "changeme" })
    end

    it "should have a password attribute" do
      expect(@user).to respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      expect(@user).to respond_to(:password_confirmation)
    end
  end

  describe "password validations" do

    before do
      @attr = { :email => "example@example.com",
        :password => "changeme", :password_confirmation => "changeme" }
    end
    
    it "should require a password" do
      expect(User.new(@attr.merge(:password => "", :password_confirmation => ""))).to_not be_valid
    end

    it "should require a matching password confirmation" do
      expect(User.new(@attr.merge(:password_confirmation => "invalid"))).to_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      expect(User.new(hash)).to_not be_valid
    end

  end

  describe "password encryption" do

    before do
      @user = FactoryBot.create(:user, { :email => "example@example.com",
        :password => "changeme", :password_confirmation => "changeme" })
    end

    it "should have an encrypted password attribute" do
      expect(@user).to respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      expect(@user.encrypted_password).to_not be_blank
    end

  end

end