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

    this.dockedItems = [
      this.topToolbar
    ]

    FSApp.views.CheckinDetailView.superclass.initComponent.call(this)

  setPlace: (place) ->
    this.currentPlace = place
    this.topToolbar.setTitle(place.data.name)

  backButtonTap: ->
    Ext.dispatch
      controller: FSApp.controllers.placesController
      action: 'backCheckinList'
})