require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  context "user is logged in" do
    before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @visitor = FactoryBot.create(:user)

        sign_in @visitor
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

      it "should show bio if user has one" do
        put :update, params: {:id => @visitor.id, :user => {:bio => 'hi!'}}
        @visitor.reload 
        get :view, params: {id: @visitor.id}
        expect(assigns(:bio)).to eq('hi!')
      end
    end
    
    describe "GET #edit" do
      it "should be successful" do
        get :edit, params: {id: @visitor.id}
        expect(response).to be_successful
      end

      it "should not be successful if signed out" do
        sign_out @visitor
        get :edit, params: {id: @visitor.id}
        expect(response).to redirect_to(view_user_url)
      end
    end

        
    describe "PUT update/:id" do
      let(:attr) do 
        { :username => 'new_username', :bio => 'hello' }
      end

      let(:bad_attr) do 
        { :username => 1 }
      end

      it "should redirect to view" do
        put :update, params: {:id => @visitor.id, :user => attr}
        @visitor.reload
        expect(response).to redirect_to(view_user_url)
      end

      it "should update fields" do
        put :update, params: {:id => @visitor.id, :user => attr}
        @visitor.reload
        expect(@visitor.username).to eql attr[:username] 
        expect(@visitor.bio).to eql attr[:bio]  
      end   

      it "should redirect if bad fields" do
        put :update, params: {:id => @visitor.id, :user => :bad_attr}
        expect(response).to redirect_to(edit_user_url)
        expect(@visitor.username).not_to eql("1")
      end 

    end
  end
end