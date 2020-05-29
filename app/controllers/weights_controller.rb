class WeightsController < ApplicationController
    
    def new
        @weight = Weight.new
    end
    def create
        @weight = Weight.create(weight_params)
    end


    private
        def weight_params
            params.require(:weight).permit(:weight_input, :user_id)
        end
end