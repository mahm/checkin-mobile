Ext.regStore 'AddableFriendStore',
  model: 'UserModel'

  proxy:
    type: 'ajax'
    url: 'friends/addable.json'
    reader:
      type: 'json'

FSApp.stores.addableFriendStore = Ext.StoreMgr.get('AddableFriendStore')
