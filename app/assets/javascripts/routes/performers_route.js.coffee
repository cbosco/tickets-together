TicketsTogether.PerformersRoute = Ember.Route.extend(
    model: ->
        TicketsTogether.Performer.find()

    events:
        addFriend: (params) ->
            TicketsTogether.Friendship.createRecord(
                friendId: params.id
            ).save()
                .then =>
                    # TODO: feedback

)


