TicketsTogether.UsersRoute = Ember.Route.extend(
    model: ->
        TicketsTogether.User.find()

    events:
        addFriend: (user) ->
            friendship = TicketsTogether.Friendship.createRecord(
                friend: user
            )
            friendship.save()
                .then =>
                    # TODO: feedback

)

