TicketsTogether.InterestsRoute = Ember.Route.extend(
    model: ->
        TicketsTogether.Interest.find()

)

