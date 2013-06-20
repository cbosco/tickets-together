TicketsTogether.InterestsFriendsRoute = Ember.Route.extend(
    model: ->
        @store.findQuery(TicketsTogether.Interest, fromFriend: true)

)

