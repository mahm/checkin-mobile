Ext.regStore 'CheckinStore',
  model: 'CheckinModel'

  proxy:
    type: 'ajax'
    url: 'checkins.json'
    reader:
      type: 'json'

  autoLoad: true

FSApp.stores.placeStore = Ext.StoreMgr.get('CheckinStore')
