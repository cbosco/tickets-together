class FriendshipsController < ApplicationController

    def index
        if current_user
            Rails.logger.error current_user.friendships.count
            @friendships = current_user.friendships(include: :friendships_friends)
            respond_to do |format|
                format.html
                format.json { 
                    render json: @friendships.as_json(
                        only:[:friend_id], include: :friend
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
        id = params[:friendship][:friendId]
        @friendship = current_user.friendships.find_by_friend_id(id)
        if @friendship.nil?
            @friendship = current_user.friendships.build(friend_id: id)
        end
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
        @friendship = current_user.friendships.find_by_friend_id(params[:id])
        @friendship.destroy
        flash[:notice] = "Removed friendship."
        # manage friendships on my profile page
        respond_to do |format|
            format.html { redirect_to current_user }
            format.json { render json: {}, status: :accepted }
        end
    end

end
