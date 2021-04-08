class ActivitiesController < ApplicationController
  def show
    id = params[:id]
    a = Membership.select('user_id').where(group_id: id)
    @activities = PublicActivity::Activity.order("created_at desc").where(group: id)
  end
end
