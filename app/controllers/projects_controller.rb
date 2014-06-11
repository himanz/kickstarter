class ProjectsController < ApplicationController
  skip_before_filter :require_login, only: :index

  def index
    @projects = if params[:search]
      Project.where(category: params[:search])
    else
      Project.all
   end
   @projects = @projects.order('projects.end_date DESC').page(params[:page])

    respond_to do |format|
      format.html
      format.js # allows the controller to respond to Javascript
    end
  end


  def new
    @project = Project.new
  end


  def create
    @project = Project.new(project_params)
    @project.owner_id = current_user.id
    
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
    @breakpoints = Breakpoint.all
    @breakpoint = Breakpoint.new
    @pledge = Pledge.new
    if current_user
      @comment = @project.comments.build
    end
  end

  def destroy

  end

  def edit

  end


private
  def project_params
    params.require(:project).permit(:title, :description, :goal, :pledge_total, :category, :start_date, :end_date, breakpoints_attributes: [:id, :pledge_title, :info, :pledge, :_destroy])
  end


end
