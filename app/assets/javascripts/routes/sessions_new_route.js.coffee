TicketsTogether.SessionsNewRoute = Ember.Route.extend(
    needs: ['currentUser']

    model: ->
        TicketsTogether.Session.createRecord()

    events:
        save: ->
            @controller.content.save()
                .then =>
                    userJSON = @controller.content.toJSON()
                    userJSON.id = 'current'
                    object = @store.load(TicketsTogether.User, userJSON)
                    user = TicketsTogether.User.find('current')

                    @controllerFor('currentUser').set('content', user)
                    @transitionTo('index')

        cancel: ->
            @controller.content.deleteRecord()
            @transitionTo('index')
)
