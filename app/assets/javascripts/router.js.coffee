TicketsTogether.Router.map (match)->
    @resource('users', ->
        @route('new')
    )
    @resource('sessions', ->
        @route('new')
        @route('destroy')
    )
