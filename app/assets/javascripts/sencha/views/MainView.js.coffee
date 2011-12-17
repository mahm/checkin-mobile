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
      # checkinListView: new FSApp.views.CheckinListView({checkinListStore: FSApp.store.checkinListStore}),
      # checkinDetailView: new FSApp.views.CheckinListView({checkinListStore: FSApp.store.checkinListStore}),
      # checkinEditView: new FSApp.views.CheckinListView({checkinListStore: FSApp.store.checkinListStore})
    })
    this.items = [
      FSApp.views.friendTimelineView
    ]

    FSApp.views.MainView.superclass.initComponent.call(this)
    this.on('render', ->
      FSApp.stores.friendActivityStore.load()
    )
})