class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]

  # GET /groups or /groups.json
  def index
    @groups = Group.search(params[:search])
  end

  # GET /groups/1 or /groups/1.json
  def show
    @group = Group.find(params[:id])
    session[:group_id] = @group.id
  end

  # GET /groups/new
  def new
    @group = Group.find(params[:id])
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups or /groups.json
  def create
    if(params[:group][:name].nil?) or (params[:group][:name] == "")
      flash[:notice] = "Group must have a name"
      redirect_to new_group_path
    else
      
      @group = group.new(group_params)

      respond_to do |format|
        if @group.save
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
      flash[:notice] = "Group must have a name"
      redirect_to edit_group_path(@project)
    else
      @group = Group.find[:id]
      @group.update(group_params)
      flash[:notice] = "#{@group.name} was sucessfully updated"
      redirect_to group_path(@group)
    end
  end
  def group_params
    params.require(:group).permit(:name, :description, :group_id)
  end
  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html{ redirect_to groups_url, notice: "Group was successfully destroyed." }
      format.json{ head :no_content }
    end
  end

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
