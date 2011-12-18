Ext.regStore 'FriendActivityStore',
  model: 'FriendActivityModel'

  proxy:
    type: 'ajax'
    url: 'friend_activities.json'
    reader:
      type: 'json'
    listeners:
      exception: (store, response, op) ->
        this.statusCode = response.status
        op.records = []

  autoLoad: false

FSApp.stores.friendActivityStore = Ext.StoreMgr.get('FriendActivityStore')
