FSApp.views.CheckinEditView = Ext.extend(Ext.Panel, {
  currentPlace: Ext.emptyFn
  checkinForm: Ext.emptyFn
  initComponent: ->
    this.backButton = new Ext.Button
      ui: 'back'
      text: 'Place'
      handler: this.backButtonTap
      scope: this

    this.topToolbar = new Ext.Toolbar
      title: 'Check In'
      items: [
        this.backButton
      ]

    this.checkinButton = new Ext.Button
      ui: 'confirm'
      text: 'Check In'
      handler: this.checkinButtonTap
      scope: this

    this.placeDetail = new Ext.Panel
      tpl: 'Do you have a fun? {name}'

    this.checkinForm = new Ext.form.FormPanel
      items: [{
        xtype: 'textareafield'
        name: 'message'
        label: 'What are you up to?'
      }]

    this.dockedItems = [
      this.topToolbar,
      this.placeDetail,
      this.checkinForm,
      this.checkinButton
    ]

    FSApp.views.CheckinEditView.superclass.initComponent.call(this)

  setPlace: (place) ->
    console.log "checkinEditView: setPlace"
    this.currentPlace = place
    this.placeDetail.update(place.data)

  backButtonTap: ->
    Ext.dispatch
      controller: FSApp.controllers.placesController
      action: 'backShowplace'
      place: this.currentPlace

  checkinButtonTap: ->
    Ext.dispatch
      controller: FSApp.controllers.placesController
      action: 'checkin'
      place: this.currentPlace
})
