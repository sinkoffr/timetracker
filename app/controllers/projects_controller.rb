class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def index
    @projects = Project.all
    @project = Project.new
  end
  
  def create
    current_user.projects.create(project_params)
    redirect_to root_path
  end
  
  def show
    @project = Project.find(params[:id])
    @summary = Record.sum(:duration_of_work)
  end
  
  private
  
  def project_params
    params.require(:project).permit(:name, :description, :project_id) 
  end
end
