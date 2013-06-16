TicketsTogether.Router.map (match)->
    @resource('users', ->
        @route('new')
    )
    this.resource('sessions', ->
        @route('new')
        @route('destroy')
    )
