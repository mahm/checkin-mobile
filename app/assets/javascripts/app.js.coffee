App = new Ext.Application
  name: 'FSApp'
  useLoadMask: true

  launch: ->
    if !FSApp.views.mainView
      FSApp.views.mainView = new FSApp.views.MainView()

    console.log "ready to load store"
    FSApp.stores.friendActivityStore.load
      scope: FSApp.stores.friendActivityStore.proxy
      callback: (records, operation, success) ->
        if this.statusCode == 401
          console.log "[LOG]need login to facebook"
          FSApp.views.mainView.tabBar.hide()
          Ext.dispatch
            controller: FSApp.controllers.loginController
            action: 'login'
        else
          console.log "[LOG]already login to facebook"
          # autoLoad on
          FSApp.stores.friendActivityStore.autoLoad = true
          FSApp.stores.placeStore.autoLoad = true
          # dispatch timeline of friends
          Ext.dispatch
            controller: FSApp.controllers.friendTimelineController
            action: 'index'
