TicketsTogether.Router.map (match)->
    @resource('users', ->
        @route('new')
    )
    @resource('sessions', ->
        @route('new')
        @route('destroy')
    )
    @resource('performers', ->
        @route('new')
        @route('destroy')
    )
    @resource('interests', ->
        @route('friends')
    )
    @resource('friendships', ->
        @route('destroy')
    )
