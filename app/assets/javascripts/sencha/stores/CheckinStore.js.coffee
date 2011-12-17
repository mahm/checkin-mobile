Ext.regStore 'CheckinStore',
  model: 'CheckinModel'

  proxy:
    type: 'ajax'
    url: 'checkins.json'
    reader:
      type: 'json'

FSApp.stores.checkinStore = Ext.StoreMgr.get('CheckinStore')
