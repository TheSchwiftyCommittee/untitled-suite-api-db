class RegistrationsController < Devise::RegistrationsController

    #Extending from devise lib
    private
   
    #Sign up method
    def sign_up
     params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
   
     #Update account/user method
    def account_update
     params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
    end
end