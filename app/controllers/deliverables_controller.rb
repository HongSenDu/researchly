class DeliverablesController < ApplicationController
  before_action :set_deliverable, only: %i[ new create show edit update destroy remove ]
  before_action :get_members, only: %i[ new create edit update destroy ]
  before_action :get_assignments, only: %i[ edit show ]
  # GET /deliverables or /deliverables.json
  def index
    @deliverables = Deliverable.all
  end

  # GET /deliverables/1 or /deliverables/1.json
  def show
    # destroy = params[:destroy]
    # if destroy.eql?("true")
    #   puts "Redirecting..."
    #   redirect_to :action => 'destroy' 
    # end
    deliverable_id = params[:id]
  end

  # GET /deliverables/new
  def new
    project_id = params[:format]
    #@deliverable = Deliverable.new
  end

  # GET /deliverables/1/edit
  def edit
    @members = @members - @people
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
    
    helpers.add_members(@members, @deliverable.id)

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

      helpers.add_members(@members, @deliverable.id)
      #puts @project
      respond_to do |format|
        if @deliverable.update(deliverable_params)
          format.html { redirect_to @deliverable, notice: "Deliverable was successfully updated." }
          format.json { render :show, status: :ok, location: @deliverable }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @deliverable.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /deliverables/1 or /deliverables/1.json
  def destroy
    project_id = (Deliverable.find params[:id]).project_id
    @project = Project.find_by_id(project_id)
    @deliverable.destroy
    respond_to do |format|
      format.html { redirect_to @project, notice: "Deliverable was successfully destroyed." }
      format.json { head :no_content }
    end
  end

    # DELETE /deliverables/1 or /deliverables/1.json
    def remove
      puts "hi"
      puts params
      Assignment.find_by(user_id: params[:user_id], deliverable_id: @deliverable.id).destroy
      redirect_to @deliverable
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deliverable
      @deliverable = Deliverable.find(params[:id] || params[:format])
    end

    def get_members
      # people within the project
      @project = Project.find_by_id @deliverable.project_id
      @members = Membership.where(:group_id => @project.group_id).pluck(:user_id)
      @members = User.where(id: @members)
    end

    def get_assignments
      # people within the deliverable
      assignments = Assignment.select('user_id').where(deliverable_id: @deliverable.id)
      @people = User.where(id:assignments)
    end
    # Only allow a list of trusted parameters through.
    def deliverable_params
      #params.fetch(:deliverable, {})
      params.require(:deliverable).permit(:name, :description, :status)
    end
end
