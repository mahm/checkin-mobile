Ext.regStore 'PlaceStore',
  model: 'PlaceModel'

  proxy:
    type: 'ajax'
    url: 'places.json'
    reader:
      type: 'json'

  autoLoad: false

FSApp.stores.placeStore = Ext.StoreMgr.get('PlaceStore')
