class HealthTipsController < ApplicationController

    def index
        @health_tips = HealthTip.all
    end

    def show
        @health_tip = HealthTip.find(params[:id]) 
    end
    
end