class WeightsController < ApplicationController
    
    def new
        if params[:user_id]
            @weight = Weight.new(:user_id => params[:user_id])
        else
            @weight = Weight.new
        end
    end

    def create
        @weight = Weight.create(weight_params)
        if @weight.valid?
            current_user.update(:weight => params[:weight][:weight_input])
            redirect_to user_path(@weight.user)
        else
            render :new
        end
        
    end


    private
        def weight_params
            params.require(:weight).permit(:weight_input, :user_id)
        end
end