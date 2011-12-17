# for DO checkin only
Ext.regModel 'CheckinModel'
  idProperty: 'id'
  fields: [
    {name: 'id', type: 'int'},
    {name: 'place_id', type: 'int'}
    {name: 'message', tyoe: 'string'}
  ]