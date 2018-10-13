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
    it "should return to root page once a project has been created" do
     
    end
    
    it "should save a project into the database when the form is submitted" do
     
    end
    
    it "should redirect if no user is logged in" do
      get :index
      expect(response).to redirect_to new_user_session_path
    end
  end
  
  describe "projects#show action" do
    # Create 2 projects to sum records for in testing
    it "should show the sum of the records" do
      
    end
    
    it "should redirect if no user is logged in" do
      get :index
      expect(response).to redirect_to new_user_session_path
    end
    
  end
  
  describe "projects#update action" do
    it "should make changes to the project name" do
      
    end
    
    it "should make change to the project description" do
      
    end
    
    it "should redirect once changes are made" do
      
    end
    
    it "should redirect if no user is logged in" do
      
    end
  end
end
