TicketsTogether.UsersNewRoute = Ember.Route.extend({
    model: ->
        TicketsTogether.User.createRecord()
    events:
        save: ->
            @content.save()
                .then =>
                    @transitionToRoute('index')
        cancel: ->
            @content.deleteRecord()
            @transitionToRoute('index')
})

