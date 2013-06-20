class InterestsController < ApplicationController
    def index
        if current_user
            @interests = current_user.interests
            respond_to do |format|
                format.html
                format.json { 
                    render json: @interests.as_json(only:[:performer_id])
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
        id = params[:interest][:performer_id]
        @interest = current_user.interests.find_by_performer_id(id)
        if @interest.nil?
            @interest =  Interest.new(user_id: current_user.id, performer_id: id)
        end
        if @interest.save
            respond_to do |format|
                format.html {
                    flash[:notice] = "Added interest."
                    redirect_to root_url
                }
                format.json { render json: {interest: {}}, status: :accepted }
            end
        else
            flash[:error] = "Unable to add interest."
            redirect_to root_url
        end
    end

    def destroy
        # TODO
    end
end
