class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]

  # GET /groups or /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1 or /groups/1.json
  def show
    @group = Group.find(params[:id])
    @projects = Project.where(group_id: @group.id)
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
      puts @results
    end
  end
  def join_group
    #check if user is already a member
    existing_memberships = Membership.where(user_id: session[:profile_id])
    
    if (existing_memberships.empty?)
      Membership.create!(user_id: session[:profile_id], group_id: params[:id])
      flash[:notice] = "Successfully Joined"
      redirect_to profile_path(session[:profile_id])
      return
    end
    
    existing_memberships.each do |member|
      if member.group_id != params[:id]
        Membership.create!(user_id: session[:profile_id], group_id: params[:id])
        flash[:notice] = "Successfully Joined"
        redirect_to profile_path(session[:profile_id])
        return
      else
        flash[:notice] = "Cannot Join Group"
      end
    end 
  end
  def leave_group
    is_a_member = Membership.find_by user_id: session[:profile_id], group_id: params[:id]
    puts is_a_member
    if(is_a_member.nil?)
      redirect_to( group_path(params[:id]), alert: "Not a member") and return
    else
      is_a_member.destroy
      flash[:notice] = "Sucessfully Left Group"
      redirect_to profile_path(session[:profile_id])
    end
  end
  def destroy
    membership_type = Membership.where(user_id: session[:profile_id], group_id: params[:id])
    if(membership_type.type == 'leader')
       @group.destroy
      respond_to do |format|
        format.html { redirect_to groups_url, notice: "Profile was successfully destroyed." }
        format.json { head :no_content }
      end  
    else
      flash[:notice] = "Must be the group leader to destroy group"
    end
  end

  # POST /groups or /groups.json
  def create
    if(params[:group][:name].nil?) or (params[:group][:name] == "")
      flash[:notice] = "Group must have a name"
      redirect_to new_group_path
    else
      
      #create a new group
      @group = Group.new(group_params)

      respond_to do |format|
        if @group.save
          #generate a code for the group
          o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
          new_code = (0...8).map { o[rand(o.length)] }.join
          puts new_code
          @group.update(code: new_code)
          #after group is created add creator to group as leader
          Membership.create!(user_id: session[:profile_id], group_id: @group.id, member_type: "leader")
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
end
