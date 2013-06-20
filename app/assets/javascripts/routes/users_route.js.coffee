TicketsTogether.UsersRoute = Ember.Route.extend(
    model: ->
        TicketsTogether.User.find()

    events:
        addFriend: (user) ->
            friendship = TicketsTogether.Friendship.createRecord(
                friend_id: user.get('id')
            )
            friendship.save()
                .then =>
                    # TODO: feedback

)

