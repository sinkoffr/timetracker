class ProjectsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @projects = Project.all
    @project = Project.new
  end
  
  def create
    current_user.projects.create(project_params)
    redirect_to root_path
  end
  
  def show
    @project = Project.find_by(id: params[:id])
    if !@project.present?
      redirect_to root_path
    else
      @summary = Record.where(:project_id => @project).sum(:duration_of_work)
    end
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    @project.update_attributes(project_params)
    redirect_to root_path
  end
  
  private
  
  def project_params
    params.require(:project).permit(:name, :description, :project_id) 
  end
end
