TicketsTogether.InterestsIndexRoute = Ember.Route.extend(
    model: ->
        TicketsTogether.Interest.find()

)

