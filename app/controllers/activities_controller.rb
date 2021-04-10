class ActivitiesController < ApplicationController
  def show
    id = params[:id]
    @activities = PublicActivity::Activity.order("created_at desc").where(group: id)
  end
end
