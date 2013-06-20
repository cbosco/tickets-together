TicketsTogether.IndexRoute = Ember.Route.extend
    redirect: ->
        @transitionTo 'performers'
