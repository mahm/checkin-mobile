Ext.regController('FriendTimelineController', {
  'index': (options) ->
    console.log "FriendTimelineController: index"
    FSApp.views.mainView.setActiveItem(
      FSApp.views.friendTimelineView
    )
})

FSApp.controllers.friendTimelineController = Ext.ControllerManager.get('FriendTimelineController')