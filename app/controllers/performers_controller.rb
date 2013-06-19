class PerformersController < ApplicationController
    def index
        response = Performer.from_seatgeek
        @performers = response['performers']
        respond_to do |format|
            format.html
            format.json { render json: {performers: @performers} }
        end
    end
end
