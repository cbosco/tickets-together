class UsersController < ApplicationController
    def new
        @user = User.new
        respond_to do |format|
            format.html
            format.json { render json: @user }
        end
    end

    def create
        @user = User.new params[:user]
        if @user.save
            respond_to do |format|
                format.html { redirect_to :root, notice: "Signed up!" }
                format.json { render json: @user, status: :created }
            end
        else
            respond_to do |format|
                format.html { render :new }
                format.json { render json: { errors: @user.errors }, status: :unprocessable_entity }
            end
        end
    end
end
