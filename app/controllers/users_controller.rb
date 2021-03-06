class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            sessions[:user_id] = @user.id
            redirect_to welcome_path
        else
            redirect_to login_path
        end        
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
