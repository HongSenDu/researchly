require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  
  context 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
    it 'receives the click on "New Project"' do
      @group = Group.create!(name: 'Group1', description: 'Description' )
      @project = Project.create!(name: 'project1', description: 'A cool Group', group_id: '1')
      get :index
      expect(response).to render_template('index')
    end
  end

  context 'GET new' do
    it 'has a 200 status code' do
      get :new
      expect(response.status).to eq(200)
    end
    it 'receives the click on "New Project"' do
      @group = Group.create!(name: 'Group1', description: 'Description' )
      @project = Project.create!(name: 'project1', description: 'A cool Group', group_id: '1')
      get :new
      expect(response).to render_template('new')
    end
  end

  context 'GET show' do 
    it 'has a 200 status code' do
      @group = Group.create!(name: 'Group1', description: 'Description' )
      @project = Project.create!(name: 'project1', description: 'A cool Group', group_id: '1')
      get :show, params: {:id => 1}
      expect(response.status).to eq(200)
    end
    it 'receives the click on "New Project"' do
      @group = Group.create!(name: 'Group1', description: 'Description' )
      @project = Project.create!(name: 'project1', description: 'A cool Group', group_id: '1')
      get :show, params: {:id => 1}
      expect(response).to render_template('show')
    end
  end

end
