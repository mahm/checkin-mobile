FSApp.views.MainView = Ext.extend(Ext.TabPanel, {
  fullscreen: true
  layout: 'card'
  cardSwitchAnimation: 'slide'
  tabBar:
    ui: 'dark'
    dock: 'bottom'
    layout:
      pack: 'center'
  listeners:
    beforecardswitch: ->
      # ugly hack...
      if this.tabBar.items.length > 4
        this.tabBar.remove(4)
        this.tabBar.render()
  initComponent: ->
    Ext.apply(FSApp.views, {
      loginView: new FSApp.views.LoginView()
      friendTimelineView: new FSApp.views.FriendTimelineView({friendActivityStore: FSApp.stores.friendActivityStore})
      checkinListView: new FSApp.views.CheckinListView({placeStore: FSApp.stores.placeStore})
      editPlaceView: new FSApp.views.EditPlaceView()
      checkinDetailView: new FSApp.views.CheckinDetailView()
      checkinEditView: new FSApp.views.CheckinEditView()
      myAccountView: new FSApp.views.MyAccountView()
      addFriendView: new FSApp.views.AddFriendView({addableFriendStore: FSApp.stores.addableFriendStore})
    })
    this.items = [
      FSApp.views.friendTimelineView,
      FSApp.views.checkinListView,
      FSApp.views.myAccountView,
      {title: 'Sign Out', iconCls: 'more', listeners: { activate: this.onSignOut }}
    ]
    FSApp.views.friendTimelineView.addListener
      eventName: 'activate'
      handler: this.onFriendsTap
    FSApp.views.checkinListView.addListener
      eventName: 'activate'
      handler: this.onCheckinTap
    FSApp.views.myAccountView.addListener
      eventName: 'activate'
      handler: this.onAccountTap

    FSApp.views.MainView.superclass.initComponent.call(this)

  onFriendsTap: ->
    Ext.dispatch
      controller: FSApp.controllers.friendTimelineController
      action: 'index'

  onCheckinTap: ->
    Ext.dispatch
      controller: FSApp.controllers.placesController
      action: 'index'

  onAccountTap: ->
    Ext.dispatch
      controller: FSApp.controllers.myAccountController
      action: 'show'

  onSignOut: ->
    window.location.href = "/signout"
})