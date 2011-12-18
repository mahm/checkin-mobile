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
      myAccountView: new FSApp.views.MyAccountView({friendStore: FSApp.stores.friendStore})
      addFriendView: new FSApp.views.AddFriendView({addableFriendStore: FSApp.stores.addableFriendStore})
    })
    this.items = [
      FSApp.views.friendTimelineView,
      FSApp.views.checkinListView,
      FSApp.views.myAccountView,
      {title: 'Sign Out', iconCls: 'more', listeners: { activate: this.onSignOut }}
    ]
    FSApp.views.MainView.superclass.initComponent.call(this)

  onSignOut: ->
    window.location.href = "/signout"
})