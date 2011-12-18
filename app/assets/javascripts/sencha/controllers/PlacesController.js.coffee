Ext.regController('PlacesController', {
  'index': (options) ->
    console.log "PlacesController: index"
    FSApp.stores.placeStore.load()
    FSApp.views.mainView.setActiveItem(
      FSApp.views.checkinListView,
      {type: 'slide', direction: 'up'}
    )
  'newplace': (options) ->
    console.log "PlacesController: newplace"
    place = Ext.ModelMgr.create({id: null, name: ''}, 'PlaceModel')
    FSApp.views.editPlaceView.load(place)
    FSApp.views.mainView.setActiveItem(
      FSApp.views.editPlaceView,
      {type: 'slide', direction: 'left'}
    )
  'showplace': (options) ->
    console.log "PlacesController: showplace"
    FSApp.views.checkinDetailView.setPlace(options.place)
    FSApp.views.mainView.setActiveItem(
      FSApp.views.checkinDetailView,
      {type: 'slide', direction: 'left'}
    )
  'backShowplace': (options) ->
    console.log "PlacesController: backShowplace"
    FSApp.views.checkinDetailView.setPlace(options.place)
    FSApp.views.mainView.setActiveItem(
      FSApp.views.checkinDetailView,
      {type: 'slide', direction: 'right'}
    )
  'backCheckinList': (options) ->
    FSApp.views.mainView.setActiveItem(
      FSApp.views.checkinListView,
      {type: 'slide', direction: 'right'}
    )
  'backFriendTimeline': (options) ->
    console.log "PlacesController: backFriendTimeline"
    FSApp.views.friendTimelineView.dockedItems.items[2].setActiveItem(0)
    FSApp.views.mainView.setActiveItem(
      FSApp.views.friendTimelineView,
      {type: 'slide', direction: 'down'}
    )

  'saveplace': (options) ->
    console.log "PlacesController: saveplace"
    currentPlace = FSApp.views.editPlaceView.getRecord()
    FSApp.views.editPlaceView.updateRecord(currentPlace)
    errors = currentPlace.validate()
    if !errors.isValid()
      currentPlace.reject()
      Ext.Msg.alert('Wait!', errors.getByField('name')[0].message, Ext.emptyFn)
      return
    unless FSApp.stores.placeStore.findRecord('id', currentPlace.data.id)
      FSApp.stores.placeStore.add(currentPlace)
    else
      currentPlace.setDirty()
    FSApp.stores.placeStore.sync()
    FSApp.views.checkinListView.refreshList()
    FSApp.views.mainView.setActiveItem(
      FSApp.views.checkinListView,
      {type: 'slide', direction: 'right'}
    )

  'checkinConfirm': (options) ->
    console.log "PlacesController: checkinConfirm"
    checkin = Ext.ModelMgr.create({
      id: null
      message: ''
      place_id: options.place.data.id
    }, 'CheckinModel')
    FSApp.views.checkinEditView.checkinForm.load(checkin)
    FSApp.views.checkinEditView.setPlace(options.place)
    FSApp.views.mainView.setActiveItem(
      FSApp.views.checkinEditView,
      {type: 'slide', direction: 'left'}
    )

  'checkin': (option) ->
    console.log "PlacesController: checkin"
    checkin = FSApp.views.checkinEditView.checkinForm.getRecord()
    console.log checkin
    Ext.Ajax.request
      url: '/checkins.json'
      method: 'post'
      params: checkin.data

    # タイムラインを更新しておく
    FSApp.views.friendTimelineView.refreshList()

    # チェックイン後の画面に表示するデータの下準備
    FSApp.views.friendTimelineView.dockedItems.items[2].setActiveItem(0)
    FSApp.views.mainView.setActiveItem(
      FSApp.views.friendTimelineView,
      {type: 'slide', direction: 'up'}
    )
    console.log option.place
    # チェックインメッセージの出力
    Ext.Msg.alert('Hooley!', 'OK! We\'ve got you @ ' + option.place.data.name);
})

FSApp.controllers.placesController = Ext.ControllerManager.get('PlacesController')