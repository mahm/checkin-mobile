FSApp.views.FriendTimelineView = Ext.extend(Ext.Panel, {
  title: 'Timeline'
  iconCls: 'time'
  friendActivityStore: Ext.emptyFn
  friendTimeline: Ext.emptyFn
  layout: 'fit'
  initComponent: ->
    this.topToolbar = new Ext.Toolbar
      title: 'Check In Timeline'

    this.friendTimeline = new Ext.List
      store: this.friendActivityStore
      emptyText: '<div style="margin:5px;">Let\'s invite your friends!</div>'
      itemTpl: '<div class="friend-timeline">{user_name} @ {place_name}<div class="checkin_time">{checkin_time}</div></div>'
      plugins: [{
        ptype: 'pullrefresh'
      }]

    this.dockedItems = [
      this.topToolbar,
      this.friendTimeline
    ]
    FSApp.views.FriendTimelineView.superclass.initComponent.call(this)

  refreshList: ->
    this.friendActivityStore.load()
    this.friendTimeline.update()
    return true
})