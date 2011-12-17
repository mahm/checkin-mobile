Ext.regModel 'FriendActivityModel'
  idProperty: 'id'
  fields: [
    {name: 'id', type: 'int'},
    {name: 'checked_at', type: 'date', dateFormat: 'c'},
    {name: 'user_name', type: 'string'},
    {name: 'place_name', type: 'string'}
  ]
