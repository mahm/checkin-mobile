Ext.regStore 'FriendStore',
  model: 'UserModel'

  proxy:
    type: 'ajax'
    url: 'friends.json'
    reader:
      type: 'json'

FSApp.stores.friendStore = Ext.StoreMgr.get('FriendStore')
