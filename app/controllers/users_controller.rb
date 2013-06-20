class UsersController < ApplicationController

    def index
        if current_user
            @users = User.all.delete_if{|u| u == current_user }
            respond_to do |format|
                format.html
                format.json { render json: @users.as_json(only:[:id, :email]) }
            end
        else
            respond_to do |format|
                format.html
                format.json { render json: {} }
            end
        end
    end

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

                format.json { render json: { user: @user.as_json(only: :email) }, status: :created }
            end
        else
            respond_to do |format|
                format.html { render :new }
                format.json { render json: { errors: @user.errors }, status: :unprocessable_entity }
            end
        end
    end

    def show
        if params[:id] == 'current'
            @user = current_user
        else
            @user = User.find(params[:id])
        end
        unless @user.nil?
            respond_to do |format|
                format.html
                format.json { render json: { user: @user.as_json(only: :email) } }
            end
        else
            respond_to do |format|
                format.html
                format.json { render json: { }, status: :accepted }
            end
        end
    end
end
