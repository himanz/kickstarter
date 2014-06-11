class CommentsController < ApplicationController
   before_filter :load_project

  def show
    @comment = Comment.find(params[:id])
    if current_user
    @comment = @project.comments.build
  	end
  end

  def create
  	@comment = @project.comments.build(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to project_path(@project.id), notice: 'Comment created successfully'}
        format.js {}
      else
        format.html {render 'projects/show', alert: 'There was an error' }
        format.js {}
      end
    end
  end

  def destroy
  	@comment = Comment.find(params[:id])
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_text, :project_id)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end
end
