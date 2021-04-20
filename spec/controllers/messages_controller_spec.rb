require 'rails_helper'
 
RSpec.describe MessagesController, type: :controller do
    
    context "user is logged in" do
        before(:each) do
            @request.env["devise.mapping"] = Devise.mappings[:user]
            @visitor = FactoryBot.create(:user)
        end
    end
    
    describe "GET #inbox" do
        it 'has a 200 status code' do
            get :inbox 
            expect(response.status).to eq(200)
        end
        it 'receives the click on "New Message"' do
            @message = Message.create!(user_id: 1, recipient_id: 2, subject: 'Group1', body: 'Group1 Description')
            get :inbox
            expect(response).to render_template('inbox')
        end
    end
    describe "GET #new" do
        it 'has a 200 status code' do
            get :new
            expect(response.status).to eq(200)
        end
        it 'receives a click on "New Group"' do
            @message = Message.create!(user_id: 1, recipient_id: 2, subject: 'Group1', body: 'Group1 Description')
            get :new
            expect(response).to render_template('new')
        end
    end
    describe "GET #show" do
        it 'has a 200 status code' do
            @message = Message.create!(user_id: 1, recipient_id: 2, subject: 'Group1', body: 'Group1 Description')
            get :show, params: {:id => 1}
            expect(response.status).to eq(200)
        end 
    end
end