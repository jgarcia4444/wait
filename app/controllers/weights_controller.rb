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
            replace_weight_if_entered_today
            @message = closer_to_goal
            current_user.update(:weight => params[:weight][:weight_input])
            redirect_to user_path(@weight.user)
        else
            render :new
        end   
    end

    def index
        @user = User.find(params[:user_id])
        @weights = @user.weights
    end

    def destroy
        weight = Weight.find(params[:id])
        user = weight.user
        weight.destroy
        redirect_to user_weights_path(user)
    end


    private
        def weight_params
            params.require(:weight).permit(:weight_input, :user_id)
        end

end