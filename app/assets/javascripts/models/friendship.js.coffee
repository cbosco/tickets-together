TicketsTogether.Friendship = DS.Model.extend
    userId: DS.attr('number')
    friendId: DS.attr('number')
    friend: DS.belongsTo('TicketsTogether.User')
