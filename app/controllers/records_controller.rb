class RecordsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @records = Record.all
    end
    
    # def show
    #     @record = Record.all
    # end
    
    # def create
    #     @record = Record.create(course_params)
    # end
    
    # private
    
    # def course_params
    #   params.require(:record).permit(:duration_of_work, :record_date)
    # end
end
