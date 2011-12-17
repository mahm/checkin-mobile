Ext.regController('PlacesController', {
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

  'backCheckinList': (options) ->
    console.log "PlacesController: canceledit"
    FSApp.views.mainView.setActiveItem(
      FSApp.views.checkinListView,
      {type: 'slide', direction: 'right'}
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

})

FSApp.controllers.placesController = Ext.ControllerManager.get('PlacesController')