TicketsTogether.Interest = DS.Model.extend
    userId: DS.attr('number')
    fromFriend: DS.attr('boolean')
    performerId: DS.attr('number')
    performer: DS.belongsTo('TicketsTogether.Performer')
