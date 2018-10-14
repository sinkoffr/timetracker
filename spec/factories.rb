FactoryBot.define do
   factory :user do
      sequence :email do |n|
          "dummyEmail@gmail.com"
      end
      password { "secretPassword" }
      password_confirmation { "secretPassword" }
   end
end

FactoryBot.define do
   factory :project do
      name "Project 1"
      description "description"
      user_id 1
   end
end

FactoryBot.define do
   factory :record do
      duration_of_work {"2.75"}
      record_date {"10/13/2018"}
      project_id 3
   end
end