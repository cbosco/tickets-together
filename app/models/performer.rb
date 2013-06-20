require 'seatgeek'

class Performer < ActiveRecord::Base
    attr_accessible :seatgeek_id

    def self.from_seatgeek
        SeatGeek::Connection.performers({per_page: 24, 'taxonomies.id' => 2000000})
    end
end
