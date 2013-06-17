TicketsTogether.UsersRoute = Ember.Route.extend(
    model: ->
        TicketsTogether.User.find()

    events:
        addFriend: (params) ->
            TicketsTogether.Friendship.createRecord(
                friendId: params.id
            ).save()
                .then =>
                    # TODO: feedback

)

