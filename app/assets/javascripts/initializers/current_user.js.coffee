# Loading data into the store
# http://nerdyworm.com/blog/2013/04/03/ember-initializers/

Ember.Application.initializer(
    name: 'currentUser'
    after: 'store'

    initialize: (container) ->
        store = container.lookup('store:main')
        user = TicketsTogether.User.find('current')
        container.lookup('controller:currentUser').set('content', user)
        container.typeInjection('controller', 'currentUser', 'controller:currentUser')
)
