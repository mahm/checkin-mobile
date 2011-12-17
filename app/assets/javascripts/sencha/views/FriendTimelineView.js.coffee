FSApp.views.FriendTimelineView = Ext.extend(Ext.Panel, {
  title: 'Friends'
  iconCls: 'user'
  friendActivityStore: Ext.emptyFn
  friendTimeline: Ext.emptyFn
  layout: 'fit'
  initComponent: ->
    this.topToolbar = new Ext.Toolbar
      title: 'foursquare'

    this.dockedItems = [
      this.topToolbar
    ]

    this.friendTimeline = new Ext.List
      store: this.friendActivityStore
      grouped: true
      emptyText: '<div style="margin:5px;">Friend activities not cached.</div>'
      itemTpl: '<div class="friend-timeline">{user_name} @ {place_name}</div>'
      onItemDisclosure: true

    this.items = [this.friendTimeline]
    FSApp.views.FriendTimelineView.superclass.initComponent.call(this)

  refreshList: ->
    this.friendTimeline.refresh()
})