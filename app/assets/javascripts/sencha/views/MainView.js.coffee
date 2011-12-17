FSApp.views.MainView = Ext.extend(Ext.Panel, {
  fullscreen: true
  layout: 'card'
  cardSwitchAnimation: 'slide'
  initComponent: ->
    Ext.apply(FSApp.views, {
      friendTimelineView: new FSApp.views.FriendTimelineView({friendActivityStore: FSApp.stores.friendActivityStore})
      checkinListView: new FSApp.views.CheckinListView({placeStore: FSApp.stores.placeStore})
      editPlaceView: new FSApp.views.EditPlaceView()
      checkinDetailView: new FSApp.views.CheckinDetailView()
      checkinEditView: new FSApp.views.CheckinEditView()
    })

    globalNavigation = new Ext.TabPanel
      tabBar:
        ui: 'dark'
        dock: 'bottom'
        layout:
          pack: 'center'
      items: [
        {title: 'Friends', iconCls: 'team', listeners: { activate: this.onFriendsTap } },
        {title: 'Check In', iconCls: 'download', listeners: { activate: this.onCheckinTap } },
        {title: 'My Account', iconCls: 'user', listeners: { activate: this.onAccountTap } }
      ]
    FSApp.views.friendTimelineView.dockedItems.items.push(globalNavigation)
    # FSApp.views.friendTimelineView.dockedItems.items.push(globalNavigation)

    FSApp.views.MainView.superclass.initComponent.call(this)
    this.on('render', ->
      FSApp.stores.friendActivityStore.load()
    )

  onFriendsTap: ->
    Ext.dispatch
      controller: FSApp.controllers.friendTimelineController
      action: 'index'

  onCheckinTap: ->
    Ext.dispatch
      controller: FSApp.controllers.placesController
      action: 'index'

  onAccountTap: ->
    console.log "you tap my account"
})