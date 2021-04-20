class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]

  # GET /groups or /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1 or /groups/1.json
  def show
    @group = Group.find(params[:id])
    @members = Membership.where(group_id: @group.id)
    @User = Membership.find_by(user_id: session[:user_id], group_id: @group.id)
    @projects = Project.where(group_id: @group.id)
 
    if (params.has_key?(:name))
      @projects = @projects.name_order
    end

    if (params.has_key?(:status))
      @projects = @projects.status_order
    end

    @activities = PublicActivity::Activity.order("created_at desc").where(group: params[:id]).first(5)
    session[:group] = @group
    session[:group_id] = @group.id
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end
  def search
    if params[:search].blank?
      redirect_to(groups_path, alert: "Empty field") and return
    else
      @parameter = params[:search].downcase
      @results = Group.all.where("lower(name) Like :search", search: "%#{@parameter}%")
    end
  end
  def join_group
    #check if user is already a member
    group = Group.find(params[:id])
    user = User.find(session[:user_id])
    if params[:group_code].blank?  
      redirect_to(groups_path, alert: "Need code") and return 
    elsif params[:group_code] !=  group.code
      redirect_to(groups_path, alert: "Wrong code") and return 
    else
      existing_memberships = Membership.where(user_id: session[:user_id], group_id: params[:id])
      if (existing_memberships.empty?) 

        members_id = Membership.where(group_id: params[:id]).pluck(:user_id)
        members = User.where(id: members_id)

        members.each do |member|
          puts member.email 
          GroupMailer.group_join(member, user, group).deliver!
        end

        Membership.create!(user_id: session[:user_id], group_id: params[:id], username: user.username)
        group.create_activity :join_group, owner: current_user, group: params[:id]

        flash[:notice] = "Successfully Joined"
        redirect_to group_path(params[:id])
        return
      end
      existing_memberships.each do |member|
        if member.group_id != params[:id]
          Membership.create!(user_id: session[:user_id], group_id: params[:id])
          flash[:notice] = "Already Joined"
          redirect_to user_path(session[:user_id])
          return
        end
      end 
    end
  end

  def leave_group
    is_a_member = Membership.find_by user_id: params[:user_id], group_id: params[:id]
    if(!is_a_member.nil?)
      group = Group.find(params[:id])
      group.create_activity :leave_group, owner: current_user, group: params[:id]

      members_id = Membership.where(group_id: params[:id]).pluck(:user_id)
      members = User.where(id: members_id)
      user = User.find_by_id(is_a_member.user_id)

      members.each do |member|
        puts member.email 
        GroupMailer.group_leave(member, user, group).deliver!
      end

      is_a_member.destroy
      flash[:notice] = "Sucessfully Left Group"
      if(params[:user_id] == session[:user_id])
        redirect_to user_path(session[:user_id])
      else(params[:user_id] != session[:user_id])
        redirect_to group_path(params[:id])
      end
    end
  end

  def destroy
    @group.destroy
      respond_to do |format|
        format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
        format.json { head :no_content }
      end 
  end

  # POST /groups or /groups.json
  def create
    if(params[:group][:name].nil?) or (params[:group][:name] == "")
      flash[:notice] = "Group must have a name and description"
      redirect_to new_group_path
    else
      
      #create a new group
      @group = Group.new(group_params)
      user = User.find(session[:user_id]) 
      respond_to do |format|
        if @group.save
          #generate a code for the group
          o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
          new_code = (0...8).map { o[rand(o.length)] }.join
          @group.update(code: new_code)
          #after group is created add creator to group as leader
          Membership.create!(user_id: session[:user_id], group_id: @group.id, member_type: 'leader', username: user.username)
          format.html {redirect_to @group, notice: "Group was successfully created."}
          format.json {render :show, status: :created, location: @group}
        else
          format.html {render :new, status: :unprocessable_entity}
          format.json {render json: @group.errors, status: :unprocessable_entity}
        end
      end
    end
  end
  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    if(params[:group][:name].nil?) or (params[:group][:name] == "")
      flash[:notice] = "Group must have a name and description"
      redirect_to edit_group_path(@group)
    elsif(params[:group][:description].nil?) or (params[:group][:description] == "")
      flash[:notice] = "Group must have a name and description"
      redirect_to edit_group_path(@group)
    else
      @group = Group.find(params[:id])
      @group.update(group_params)
      flash[:notice] = "#{@group.name} was sucessfully updated"
      redirect_to group_path(@group)
    end
  end
  def make_leader
    membership = Membership.find_by user_id: params[:user_id], group_id: params[:id]
    @group = Group.find(params[:id])
    if(membership.member_type != "leader")
      membership.update_attribute(:member_type, "leader")
      flash[:notice] = "#{membership.username} is now a leader"
      redirect_to group_path(@group)
    else
      flash[:notice] = "Already a group leader"
      redirect_to group_path(@group)
    end
  end
  def group_params
    params.require(:group).permit(:name, :description, :group_id)
  end
  # DELETE /groups/1 or /groups/1.json
  # def destroy
  #   @group.destroy
  #   respond_to do |format|
  #     format.html{ redirect_to groups_url, notice: "Group was successfully destroyed." }
  #     format.json{ head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])

    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name, :description)
    end

    def current_user
      user = User.find(session[:user_id])
    end
end
