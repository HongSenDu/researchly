class WelcomeController < ApplicationController

  before_action :check_signed_in

  def check_signed_in
    redirect_to profile_path(current_user) if signed_in?
  end

  def index
    puts "hi"
  end
end
