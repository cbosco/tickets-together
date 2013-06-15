TicketsTogether.Router.map (match)->
    @resource('users', ->
        @route('new')
    )
