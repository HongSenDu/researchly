require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
    
    context "user is logged in" do
        before(:each) do
            @request.env["devise.mapping"] = Devise.mappings[:user]
            @visitor = FactoryBot.create(:user)
        end
    end
    
    describe "GET #index" do
        it 'has a 200 status code' do
            get :index 
            expect(response.status).to eq(200)
        end
        it 'receives the click on "New Group"' do
            @group = Group.create!(name: 'Group1', description: 'Group1 Description')
            get :index
            expect(response).to render_template('index')
        end
    end
    describe "GET #new" do
        it 'has a 200 status code' do
            get :new
            expect(response.status).to eq(200)
        end
        it 'receives a click on "New Group"' do
            @group = Group.create!(name: 'Group1', description: 'Group1 Description')
            get :new
            expect(response).to render_template('new')
        end
    end
    describe "GET #show" do
        it 'has a 200 status code' do
            @group = Group.create!(name: 'Group1', description: 'Group1 Description')
            get :show, params: {:id => 1}
            expect(response.status).to eq(200)
        end 
        it 'receives the click on "New Project' do
            @group = Group.create!(name: 'Group1', description: 'Group1 Description')
            get :show, params: {:id => 1}
            expect(response).to render_template('show')
        end
    end
end