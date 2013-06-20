TicketsTogether.FriendshipsRoute = Ember.Route.extend(
    model: ->
        TicketsTogether.Friendship.find()

    events:
        removeFriend: (friendship) ->
            friendship.deleteRecord()
            friendship.get('transaction').commit()

)

