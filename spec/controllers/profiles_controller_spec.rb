require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  context "user is logged in" do
    before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @visitor = FactoryBot.create(:user)
        # @visitor.confirm! # Or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
    end

    describe "GET #index" do
      it "returns a success response" do
        get :index
        expect(response).to be_successful
      end
    end

    describe "GET #show" do
        it "should be successful" do
          get :show, params: {id: @visitor.id}
          expect(response).to be_successful
        end
  
        it "should find the right groups" do
          get :view, params: {id: @visitor.id}
          expect(assigns(:groups)).to be_nil
        end
      end
    

    describe "GET #view" do
      it "should be successful" do
        get :view, params: {id: @visitor.id}
        expect(response).to be_successful
      end

      it "should find the right user" do
        get :view, params: {id: @visitor.id}
        expect(assigns(:user)).to eq(@visitor)
      end
    end
  end
end