class PledgesController < ApplicationController
	before_filter :load_project, only: :create

  def new
	end

	def create
		@pledge = Pledge.new(pledge_params)
		@pledge.user_id = current_user.id

    respond_to do |format|
			if @pledge.save
        format.html { redirect_to @project, notice: 'Review added.' }
        format.js {} 
      else
        format.html { render 'products/show', alert: 'There was an error.'  }
        format.js {} 
      end
    end

	end

  private
  def pledge_params
  	params.require(:pledge).permit(:project_id, :breakpoint_id, :user_id)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end
end