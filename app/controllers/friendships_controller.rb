class FriendshipsController < ApplicationController

    def index
        if current_user
            Rails.logger.error current_user.friendships.count
            @friendships = current_user.friendships(include: :friendships_friends)
            respond_to do |format|
                format.html
                format.json { 
                    render json: @friendships.as_json(
                        only:[:friend_id, :email]
                ) 
                }
            end
        else
            # TODO: error messaging? (this won't be a link on the page)
            respond_to do |format|
                format.html
                format.json { render json: {} }
            end
        end
    end

    def create
        @friendship = current_user.friendships.build(:friend_id => params[:friendship][:friend_id])
        if @friendship.save
            respond_to do |format|
                format.html {
                    flash[:notice] = "Added friend."
                    redirect_to root_url
                }
                format.json { render json: {friendship: {}}, status: :accepted }
            end
        else
            flash[:error] = "Unable to add friend."
            redirect_to root_url
        end
    end

    def destroy
        @friendship = current_user.friendships.find(params[:id])
        @friendship.destroy
        flash[:notice] = "Removed friendship."
        # manage friendships on my profile page
        redirect_to current_user
    end

end
