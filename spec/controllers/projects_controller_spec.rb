require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  
  describe "projects#index action" do
    it "loads when user is logged in" do
      user = FactoryBot.create(:user)
      sign_in user
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "should redirect if no user is logged in" do
      get :index
      expect(response).to redirect_to new_user_session_path
    end
  end
  
  describe "projects#create action" do
    it "should create a new project in the database" do
      user = FactoryBot.create(:user)
      sign_in user
      post :create, params: { project: { name: 'Hello!', description: 'a description of the job' } }
      project = Project.last
      expect(project.name).to eq("Hello!")
      expect(project.description).to eq('a description of the job')
    end
    
    it "should redirect to the root page once form is submitted" do
      user = FactoryBot.create(:user)
      sign_in user
      post :create, params: { project: { name: 'Hello!', description: 'a description of the job' } }
      expect(response).to have_http_status(:redirect)
    end
    
    it "should redirect if no user is logged in" do
      post :create
      expect(response).to redirect_to new_user_session_path
    end
  end
  
  describe "projects#show action" do
    it "should show the summary page if a project is found" do
      user = FactoryBot.create(:user)
      sign_in user
      project = FactoryBot.create(:project)
      get :show, params: { id: project.id }
      expect(response).to have_http_status(:success)
    end
    
    it "should redirect to home page if no project is found" do
      user = FactoryBot.create(:user)
      sign_in user
      get :show, params: { id: 'error' }
      expect(response).to redirect_to root_path
    end
    
    it "should show the sum of the records" do
      user = FactoryBot.create(:user)
      sign_in user
      project_1 = FactoryBot.create(:project, name: "Project 1")
      project_2 = FactoryBot.create(:project, name: "Project 2")
      
      FactoryBot.create(:record, duration_of_work: 3, project_id: project_1.id)
      FactoryBot.create(:record, duration_of_work: 2.25, project_id: project_2.id)
      FactoryBot.create(:record, duration_of_work: 1.75, project_id: project_1.id)
      FactoryBot.create(:record, duration_of_work: 0.75, project_id: project_2.id)
      get :show, params: { id: project_2.id }
      
      expect(assigns(:summary)).to eq 3.00
    end
    
    it "should redirect if no user is logged in" do
      project = FactoryBot.create(:project)
      get :show, params: { id: project.id }
      expect(response).to redirect_to new_user_session_path
    end
  end
  
  describe "projects#update action" do
    it "should make changes to the project name" do
      user = FactoryBot.create(:user)
      sign_in user
      project = FactoryBot.create(:project, name: "Initial Name")
      patch :update, params: { id: project, project: { name: 'Changed' } }
      expect(response).to have_http_status(:found)
      project.reload
      expect(project.name).to eq 'Changed'
    end
    
    it "should make change to the project description" do
      user = FactoryBot.create(:user)
      sign_in user
      project = FactoryBot.create(:project, description: "Initial Description")
      patch :update, params: { id: project, project: { description: 'Changed' } }
      expect(response).to have_http_status(:found)
      project.reload
      expect(project.description).to eq 'Changed'
    end
    
    it "should redirect if no user is logged in" do
      project = FactoryBot.create(:project, description: "Initial Description")
      patch :update, params: { id: project, project: { description: 'Changed' } }
      expect(response).to redirect_to new_user_session_path
    end
  end
end
