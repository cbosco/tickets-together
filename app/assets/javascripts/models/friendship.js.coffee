TicketsTogether.Friendship = DS.Model.extend
    userId: DS.attr('number')
    friendId: DS.attr('number')
    email: DS.attr('string')