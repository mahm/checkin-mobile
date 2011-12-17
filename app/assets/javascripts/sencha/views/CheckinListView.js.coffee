FSApp.views.CheckinListView = Ext.extend(Ext.Panel, {
  title: 'Check In'
  iconCls: 'download'
  placeStore: Ext.emptyFn
  placesList: Ext.emptyFn
  layout: 'card'
  initComponent: ->
    this.newButton = new Ext.Button
      ui: 'action'
      text: 'New Place'
      scope: this
      handler: this.newButtonTap

    this.cancelButton = new Ext.Button
      ui: 'back'
      text: 'Cancel'
      scope: this
      handler: this.cancelButtonTap

    this.topToolbar = new Ext.Toolbar
      title: 'Nearby Places'
      items: [
        this.cancelButton,
        {xtype: 'spacer'},
        this.newButton
      ]

    this.dockedItems = [
      this.topToolbar
    ]

    this.placesList = new Ext.List
      store: this.placeStore
      emptyText: '<div style="margin:5px;">Nearby place not found.</div>'
      itemTpl: '<div class="friend-timeline">{name}</div>'
      onItemDisclosure: true
      plugins: [
        {ptype: 'pullrefresh'}
      ]

    this.placesList.on('disclose', (record, index, evt) ->
      this.showPlaceTap(record, index)
    , this)

    this.items = [this.placesList]
    FSApp.views.CheckinListView.superclass.initComponent.call(this)

  refreshList: ->
    this.placesList.refresh()

  newButtonTap: ->
    Ext.dispatch
      controller: FSApp.controllers.placesController
      action: 'newplace'

  showPlaceTap: (record, index) ->
    Ext.dispatch
      controller: FSApp.controllers.placesController
      action: 'showplace'
      place: record

  cancelButtonTap: ->
    Ext.dispatch
      controller: FSApp.controllers.placesController
      action: 'backFriendTimeline'

})