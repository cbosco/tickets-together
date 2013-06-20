TicketsTogether.Interest = DS.Model.extend
    userId: DS.attr('number')
    performerId: DS.attr('number')
    performer: DS.belongsTo('TicketsTogether.Performer')
