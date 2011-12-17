Ext.regController('FriendTimelineController', {
  'index': (options) ->
    console.log "FriendTimelineController: index"
    if !FSApp.views.mainView
      FSApp.views.mainView = new FSApp.views.MainView()

    FSApp.views.mainView.setActiveItem(
      FSApp.views.friendTimelineView
    )
})

FSApp.controllers.friendTimelineController = Ext.ControllerManager.get('FriendTimelineController')