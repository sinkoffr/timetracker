require 'rails_helper'

RSpec.describe RecordsController, type: :controller do

  describe "records#create action" do
    it "should create a new project in the database" do
      user = FactoryBot.create(:user)
      sign_in user
      project = FactoryBot.create(:project)
      post :create, params: { record: { duration_of_work: 5.25, record_date: '12/10/2018'}, project_id: project.id }
      record = Record.last
      expect(record.record_date).to eq Date.new(2018, 10, 12)
      expect(record.duration_of_work).to eq(5.25)
    end
    
    it "should redirect to the project summary page once the form is submitted" do
      user = FactoryBot.create(:user)
      sign_in user
      project = FactoryBot.create(:project)
      post :create, params: { record: { duration_of_work: 5.25, record_date: '12/10/2018'}, project_id: project.id }
      expect(response).to redirect_to project_path(project.id)
    end
  end
end
