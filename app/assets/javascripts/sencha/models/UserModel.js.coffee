Ext.regModel 'UserModel'
  idProperty: 'id'
  fields: [
    {name: 'id', type: 'int'},
    {name: 'name', type: 'string'},
    {name: 'uid', type: 'string'},
    {name: 'auth', type: 'string'},
    {name: 'created_at', type: 'date', format: 'c'},
    {name: 'updated_at', type: 'date', format: 'c'},
    {name: 'provider', type: 'string'}
  ]
