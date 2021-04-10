require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do

  context "GET /show" do
    it "returns http success" do
        get(:show, params: {'id' => "1"}, session: {'group_id' => 1})
      expect(response).to have_http_status(:success)
    end
    it 'renders activities show view' do
        get(:show, params: {'id' => "1"}, session: {'group_id' => 1})
      expect(response).to render_template('show')
    end
  end

end