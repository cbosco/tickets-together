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
        @interest = nil
        # (this is a seatgeek ID)
        id = params[:interest][:performer_id]
        p = Performer.find_by_seatgeek_id(id)
        unless p.nil?
            @interest = current_user.interests.find_by_performer_id(p.id)
        end
        if @interest.nil?

            if p.nil?
                p = Performer.new(seatgeek_id: id)
            end
            @interest = Interest.new
            @interest.performer = p
            current_user.interests << @interest
        end
        if p.save && current_user.save && @interest.save
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
