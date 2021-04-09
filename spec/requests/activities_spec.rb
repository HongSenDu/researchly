require 'rails_helper'

RSpec.describe "Activities", type: :request do

  context "GET /show" do
    it "returns http success" do
      get "/activities/show"
      expect(response).to have_http_status(:success)
    end
    it 'renders activities show view' do
      get "/activities/show"
      expect(response).to render_template('show')
    end
  end

end
