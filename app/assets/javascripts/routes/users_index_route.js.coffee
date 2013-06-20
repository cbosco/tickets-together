TicketsTogether.UsersIndexRoute = Ember.Route.extend(
    model: ->
        # TODO: exclude currentUser client-side as well
        TicketsTogether.User.find()

    events:
        addFriend: (user) ->
            # BUG! This creates duplicate NULL records client-side
            friendship = TicketsTogether.Friendship.createRecord(
                friend: user
            )
            friendship.save()
                .then =>
                    # TODO: feedback

)

