TicketsTogether.FriendshipsRoute = Ember.Route.extend(
    model: ->
        TicketsTogether.Friendship.find()

    events:
        removeFriend: (friendship) ->
            friendship.deleteRecord().save()
            friendship.get('transaction').commit()

)

