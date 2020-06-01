class HealthTipsController < ApplicationController

    def index
        @lose_weight_tips = HealthTip.filter("Lose Weight")
        @gain_weight_tips = HealthTip.filter("Gain Weight")
    end

    def show
        @health_tip = HealthTip.find(params[:id]) 
    end
    
end