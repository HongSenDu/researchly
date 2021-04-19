require 'rails_helper'

RSpec.describe DeliverablesController, type: :controller do

    describe "GET #index" do
        it 'has a 200 status code' do
            get :index 
            expect(response.status).to eq(200)
        end
    end

    describe "GET #new" do
        it 'has a 200 status code' do
            @group = Group.create!(name: 'Group1', description: 'Group1 Description')
            @project = Project.create!(name: 'Project 1', description: 'Interesting project', group_id: 1)
            get :new, params: {:format => 1}
            expect(response.status).to eq(200)
        end
    end

    describe "GET #show" do
        it 'has a 200 status code' do
            @group = Group.create!(name: 'Group1', description: 'Group1 Description')
            @project = Project.create!(name: 'Project 1', description: 'Interesting project', group_id: 1)
            @deliverable = Deliverable.create!(name: 'Deliver 1', description: 'The first deliverable', project_id: 1)
            get :show, params: {:id => 1}
            expect(response.status).to eq(200)
        end 
    end

end