class DeliverablesController < ApplicationController
  before_action :set_deliverable, only: %i[ show edit update destroy ]

  # GET /deliverables or /deliverables.json
  def index
    @deliverables = Deliverable.all
  end

  # GET /deliverables/1 or /deliverables/1.json
  def show
  end

  # GET /deliverables/new
  def new
    project_id = params[:format]
    @project = Project.find_by_id project_id
    #@deliverable = Deliverable.new
  end

  # GET /deliverables/1/edit
  def edit
    #puts "Hello world"
    #puts params
  end

  # POST /deliverables or /deliverables.json
  def create
    project_id = params[:format]
    deliverable_new = Hash.new
    deliverable_new[:name] = deliverable_params[:name]
    deliverable_new[:description] = deliverable_params[:description]
    deliverable_new[:status] = deliverable_params[:status]
    deliverable_new[:project_id] = project_id
    @project = Project.find_by_id(project_id)
    @deliverable = Deliverable.new(deliverable_new)
    @deliverable.save
    redirect_to @project, notice: "Deliverable was successfully created."
    
    #respond_to do |format|
    #  if @deliverable.save
    #    format.html { redirect_to @deliverable, notice: "Deliverable was successfully created." }
    #    format.json { render :show, status: :created, location: @deliverable }
    #  else
    #    format.html { render :new, status: :unprocessable_entity }
    #    format.json { render json: @deliverable.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PATCH/PUT /deliverables/1 or /deliverables/1.json
  def update

    if (params[:deliverable][:name].nil?) or (params[:deliverable][:name] == "")
      flash[:alert] = "Deliverable must have a name"
      redirect_to edit_deliverable_path
    else 
    
      project_id = (Deliverable.find params[:id]).project_id
      #puts "The project ID is #{project_id}"
      @project = Project.find_by_id(project_id)
      #puts @project
      respond_to do |format|
        if @deliverable.update(deliverable_params)
          format.html { redirect_to @project, notice: "Deliverable was successfully updated." }
          format.json { render :show, status: :ok, location: @deliverable }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @deliverable.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /deliverables/1 or /deliverables/1.json
  # def destroy
  #   @deliverable.destroy
  #   respond_to do |format|
  #     format.html { redirect_to deliverables_url, notice: "Deliverable was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deliverable
      @deliverable = Deliverable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deliverable_params
      #params.fetch(:deliverable, {})
      params.require(:deliverable).permit(:name, :description, :status)
    end
end
