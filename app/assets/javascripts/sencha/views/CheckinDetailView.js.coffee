FSApp.views.CheckinDetailView = Ext.extend(Ext.Panel, {
  currentPlace: Ext.emptyFn
  initComponent: ->
    this.backButton = new Ext.Button
      ui: 'back'
      text: 'Places'
      handler: this.backButtonTap
      scope: this

    this.topToolbar = new Ext.Toolbar
      title: 'Detail'
      items: [
        this.backButton
      ]

    this.checkinButton = new Ext.Button
      ui: 'confirm'
      text: 'Check In Here'
      handler: this.checkinButtonTap
      scope: this

    this.placeDetail = new Ext.Panel
      tpl: 'Do you have a fun? {name}'

    this.dockedItems = [
      this.topToolbar,
      this.placeDetail,
      this.checkinButton
    ]

    FSApp.views.CheckinDetailView.superclass.initComponent.call(this)

  setPlace: (place) ->
    this.currentPlace = place
    this.topToolbar.setTitle(place.data.name)
    this.placeDetail.update(place.data)

  backButtonTap: ->
    Ext.dispatch
      controller: FSApp.controllers.placesController
      action: 'backCheckinList'

  checkinButtonTap: ->
    Ext.dispatch
      controller: FSApp.controllers.placesController
      action: 'checkinConfirm'
      place: this.currentPlace
})