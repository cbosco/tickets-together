TicketsTogether.PerformersRoute = Ember.Route.extend(
    model: ->
        TicketsTogether.Performer.find()

    events:
        addInterest: (performer) ->
            interest = TicketsTogether.Interest.createRecord(
                performer: performer
            )
            interest.save()
                .then =>
                    # TODO: feedback

)


