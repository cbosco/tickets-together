TicketsTogether.UsersNewRoute = Ember.Route.extend({
    model: ->
        TicketsTogether.User.createRecord()
    events:
        save: ->
            @controller.content.save()
                .then =>
                    @transitionTo('index')
        cancel: ->
            @controller.content.deleteRecord()
            @transitionTo('index')
})

