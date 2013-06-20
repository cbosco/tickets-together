TicketsTogether.Serializer = DS.RESTSerializer.extend
    primaryKey: (type) ->
        if type == TicketsTogether.Friendship
            return 'friend_id'
        else
            return 'id'


TicketsTogether.Adapter = DS.RESTAdapter.extend
    serializer: TicketsTogether.Serializer.create()

TicketsTogether.Store = DS.Store.extend
    adapter: TicketsTogether.Adapter.create()

