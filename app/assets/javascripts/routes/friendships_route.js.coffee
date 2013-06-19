TicketsTogether.FriendshipsRoute = Ember.Route.extend(
    model: ->
        TicketsTogether.Friendship.find()

    events:
        removeFriend: (params) ->
            TicketsTogether.Friendship.removeRecord(
                friendId: params.id
            ).save()
                .then =>
                    # TODO: feedback

)

