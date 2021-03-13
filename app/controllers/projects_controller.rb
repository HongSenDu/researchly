class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
    @project = Project.find(params[:id])
		@deliverables = Deliverable.where(project_id: params[:id])
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
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :description, :group_id)
    end
end
