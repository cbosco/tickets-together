class FriendshipsController < ApplicationController

    def create
        @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
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
