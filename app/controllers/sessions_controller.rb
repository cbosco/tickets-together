class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.authenticate params[:session]
        if user
            session[:user_id] = user.id

            respond_to do |format|
                format.html { redirect_to :root, notice: "Logged in!" }
                format.json { render json: { session: user.as_json(only: :email) }, status: :created }
            end
        else

            respond_to do |format|
                format.html {
                    flash.now.alert = "Invalid email or password"
                    render :new
                }
                format.json { render json: { errors: {email: "Invalid email or password"} }, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to :root, notice: "Logged out!"
    end
end
