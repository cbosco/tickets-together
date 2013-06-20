require 'seatgeek'

class Performer < ActiveRecord::Base
    attr_accessible :seatgeek_id

    def self.concerts_from_seatgeek
        SeatGeek::Connection.performers({per_page: 24, 'taxonomies.id' => 2000000})
    end

    def seatgeek_model
        SeatGeek::Connection.performers({id: self.seatgeek_id})
    end
end
