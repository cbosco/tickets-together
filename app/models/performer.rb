require 'seatgeek'

class Performer < ActiveRecord::Base
    attr_accessible :seatgeek_id

    def self.from_seatgeek
        SeatGeek::Connection.performers
    end
end
