class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @project = Project.new
  end
  
  def create
    Project.create(project_params)
    redirect_to root_path
  end
  
  def new
      
  end
  
  private
  
  def project_params
    params.require(:project).permit(:name, :description) 
  end
end
