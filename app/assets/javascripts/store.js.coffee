TicketsTogether.Serializer = DS.RESTSerializer.extend
    primaryKey: (type) ->
        if type == TicketsTogether.Friendship
            return 'friend_id'
        else
            return 'id'


TicketsTogether.Adapter = DS.RESTAdapter.extend
    serializer: TicketsTogether.Serializer.create()

# TODO: instead of more requests sideload these (1 to 1 possible?)
TicketsTogether.Adapter.map(TicketsTogether.Friendship, {
  friend: { embedded: 'always' }
});
TicketsTogether.Adapter.map(TicketsTogether.Interest, {
  performer: { embedded: 'always' }
});

TicketsTogether.Store = DS.Store.extend
    adapter: TicketsTogether.Adapter.create()

