TicketsTogether.Router.map (match)->
    this.resource('users', ->
        this.route('new')
    )
