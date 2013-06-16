TicketsTogether.SessionsDestroyRoute = Ember.Route.extend(
    enter: ->
        controller = @controllerFor('currentUser');
        controller.set('content', undefined);

        TicketsTogether.Session.find('current')
            .then (session) ->
                session.deleteRecord()
                controller.store.commit()

        this.transitionTo('index')
)
