class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit view update destroy ]
  before_action :is_current_user, only: %i[ show edit view update destroy ]
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    id = params[:id]
    memberships = Membership.where(user_id: id)
    m = memberships.select('group_id')
    @groups = Group.where(id:m)
    @leads = []
    @users = []
    memberships.each do |membership|
      @leads.append(Membership.where(:group_id => membership.group_id, :member_type => "leader").pluck(:username)[0])
    end
    assignments = Assignment.where(:user_id => id)
    @deliverables = Deliverable.where(id: assignments.pluck(:deliverable_id))
    @deliverables.each do |deliverable|
      all_user_assignments = Assignment.where(:deliverable_id => deliverable.id).pluck("user_id")
      @users.append(User.where(:id => all_user_assignments))
    end
    puts @users
    session[:user_id] = id
  end

  def view
    if @user.bio == nil
      @bio = "You do not have a bio yet! Click edit write one."
    else
      @bio = @user.bio
    end
  end

  #GET /users/new
  # def new
  #   @user = User.new
  # end

  #GET /users/1/edit
  def edit
    if @is_current_user == false
      redirect_to view_user_path(@user.id)
    end 
  end

  # #POST /users or /users.json
  # def create
  #   @user = User.new(user_params)

  #   respond_to do |format|
  #     if @user.save
  #       format.html { redirect_to @user, notice: "user was successfully created." }
  #       format.json { render :show, status: :created, location: @user }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      begin
        @user.update(user_params.permit(:username, :bio, :avatar, :remove_avatar, :avatar_cache))
        format.html { redirect_to view_user_path(@user.id), notice: 'User was successfully updated.' }
        format.json { render :view, status: :ok, location: @user }
      rescue
        format.html { redirect_to edit_user_path(@user.id) }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  # def destroy
  #   @user.destroy
  #   respond_to do |format|
  #     format.html { redirect_to users_url, notice: "user was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {})
    end

    def is_current_user
      if current_user
        @is_current_user = (current_user['id'] == @user.id)
      else
        @is_current_user = false
      end
    end
end
