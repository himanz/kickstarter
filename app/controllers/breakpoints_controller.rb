class BreakpointsController < ApplicationController
  before_filter :load_project, :only => [:index, :new, :create]

  def index
    @breakpoints = Breakpoint.all
  end

  def new
    @breakpoint = Breakpoint.new
  end


  def create
    @breakpoint = @project.breakpoints.build(breakpoint_params)

    respond_to do |format|
      if @breakpoint.save
        format.html { redirect_to @project }
        format.js {}
      else
        format.html { render 'new' }
        format.js {}
      end
    end
  end

private
  def breakpoint_params
    params.require(:breakpoint).permit(:pledge_title, :info, :pledge)
  end

  def load_project
    @project= Project.find(params[:project_id])
  end

end