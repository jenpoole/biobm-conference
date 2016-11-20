class UsersController < ApplicationController
    # Only logged in users can view profile
    before_action :authenticate_user!
    
    # before_action :require_same_user, only: [:show, :edit, :update]
    
    def show
        @user = User.find(params[:id])
    end
    
    def manage_events
    end
    
end