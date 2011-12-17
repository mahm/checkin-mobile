Ext.regStore 'FriendActivityStore',
  model: 'FriendActivityModel'

  proxy:
    type: 'ajax'
    url: 'friend_activities.json'
    reader:
      type: 'json'

  autoLoad: true

FSApp.stores.friendActivityStore = Ext.StoreMgr.get('FriendActivityStore')
