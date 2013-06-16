TicketsTogether.SessionsNewRoute = Ember.Route.extend(
    needs: ['currentUser']

    model: ->
        TicketsTogether.Session.createRecord()

    events:
        save: ->
            @controller.content.save()
                .then =>
                    @transitionTo('index')

        cancel: ->
            @controller.content.deleteRecord()
            @transitionTo('index')
)
