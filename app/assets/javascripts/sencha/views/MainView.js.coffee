FSApp.views.MainView = Ext.extend(Ext.TabPanel, {
  fullscreen: true
  layout: 'card'
  cardSwitchAnimation: 'slide'
  defaults:
    scroll: 'vertical'
  tabBar:
    dock: 'bottom'
    ui: 'dark'
    layout:
      pack: 'center'
  initComponent: ->
    Ext.apply(FSApp.views, {
      friendTimelineView: new FSApp.views.FriendTimelineView({friendActivityStore: FSApp.stores.friendActivityStore})
      checkinListView: new FSApp.views.CheckinListView({placeStore: FSApp.stores.placeStore})
      editPlaceView: new FSApp.views.EditPlaceView()
      checkinDetailView: new FSApp.views.CheckinDetailView()
      # checkinEditView: new FSApp.views.CheckinListView({checkinListStore: FSApp.store.checkinListStore})
    })
    this.items = [
      FSApp.views.friendTimelineView,
      FSApp.views.checkinListView
    ]

    FSApp.views.MainView.superclass.initComponent.call(this)
    this.on('render', ->
      FSApp.stores.friendActivityStore.load()
    )
})