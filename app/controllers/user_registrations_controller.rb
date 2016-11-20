class UserRegistrationsController < Devise::RegistrationsController

    private
    
        def sign_up_params
            params.require(:user).permit(:first_name, :last_name, :country, :company, :email, :password, :password_confirmation, :join_email_list)
        end
            
        def account_update_params
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
        end

end