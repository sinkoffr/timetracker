class RecordsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @project = Project.find(params[:project_id])
    @record = Record.new
  end
  
  def create
    @project = Project.find(params[:project_id])
    @records = @project.records.create(record_params)
    redirect_to project_path(@project)
  end


  private
  
  def project_params
    params.require(:project).permit(:project_id, :name)
  end
  
  def record_params
    params.require(:record).permit(:duration_of_work, :record_date) 
  end
end
