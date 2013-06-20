TicketsTogether.PerformersRoute = Ember.Route.extend(
    model: ->
        TicketsTogether.Performer.find()

    events:
        addInterest: (performer) ->
            TicketsTogether.Interest.createRecord(
                performerId: performer.id
            ).save()
                .then =>
                    # TODO: feedback

)


