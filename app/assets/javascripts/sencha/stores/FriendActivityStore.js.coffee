Ext.regStore 'FriendActivityStore',
  model: 'FriendActivityModel'

  sorters: [
    property: 'checked_at'
    direction: 'DESC'
  ]

  proxy:
    type: 'localstorage'
    id: 'id'
    # type: 'ajax'
    # url: 'friend_activities.json'
    # reader:
    #   type: 'json'

  # autoLoad: true

  getGroupString: (record) ->
    if record && record.data.created_at
      return record.get('checked_at').toDateString()
    else
      return ''

  data: [
    {id: 1, user_name: 'test', place_name: 'test', checked_at: new Date()}
  ]

FSApp.stores.friendActivityStore = Ext.StoreMgr.get('FriendActivityStore')
