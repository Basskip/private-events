class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by_email(params[:email])
        if @user
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash.now[:error] = "No such user"
            render 'new'
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to signin_path
    end
end
