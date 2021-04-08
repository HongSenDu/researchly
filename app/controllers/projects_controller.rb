class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
    @project = Project.find(params[:id])
    sort = params[:sort]
    if (not sort.nil?) and sort.eql?("status")
      @deliverables = Deliverable.where(project_id: params[:id]).order(:status)
    else
      @deliverables = Deliverable.where(project_id: params[:id])
    end
		#@deliverables = Deliverable.where(project_id: params[:id])

    if @deliverables.length == 0
      @msg = "No deliverables created for this project"
    else
      total = @deliverables.length.to_f
      fin1 = @deliverables.where(status: "Complete").length
      fin2 = @deliverables.where(status: "complete").length
      res = (((fin1 + fin2)/ total) * 100).round(2)
      @msg = "Percent Completed: #{res}%"
    end
    session[:project_id] = params[:id]
  end

  # GET /projects/new
  def new
    @project = Project.new 
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    if (params[:project][:name].nil?) or (params[:project][:name] == "")
      flash[:notice] = "Project must have a name"
      redirect_to new_project_path
    else  

      @project = Project.new(project_params)

      respond_to do |format|
        if @project.save
          format.html { redirect_to @project, notice: "Project was successfully created." }
          format.json { render :show, status: :created, location: @project }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
      @project.create_activity :create, owner: current_user, group: group_id
    end
  end
  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    if (params[:project][:name].nil?) or (params[:project][:name] == "")
      flash[:notice] = "Project must have a name"
      redirect_to edit_project_path(@project)
    else 

      @project = Project.find params[:id]
      @project.update(project_params)
      flash[:notice] = "#{@project.name} was successfully updated."
      redirect_to project_path(@project)
    end
    @project.create_activity :update, owner: current_user, group: group_id
  end

  #DELETE /projects/1 or /projects/1.json
  def destroy
    @project.create_activity :destroy, owner: current_user, group: group_id
    @project.destroy
    respond_to do |format|
      format.html { redirect_to group_path(session[:group_id]), notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id] || params[:format])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :description, :group_id, :status)
    end

    def group_id
      id = session[:group_id]
    end

end
