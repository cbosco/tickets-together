class PerformersController < ApplicationController
    def index
        response = Performer.concerts_from_seatgeek
        @performers = response['performers']
        respond_to do |format|
            format.html
            format.json { render json: {performers: @performers} }
        end
    end

    def show
        p = Performer.find(params[:id])
        @performer = p.seatgeek_model

        respond_to do |format|
            format.html
            format.json { render json: {performer: @performer} }
        end
    end
end
