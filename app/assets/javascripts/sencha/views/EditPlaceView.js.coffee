FSApp.views.EditPlaceView = Ext.extend(Ext.form.FormPanel, {
  initComponent: ->
    this.backButton = new Ext.Button
      ui: 'back'
      text: 'Back'
      handler: this.backButtonTap
      scope: this

    this.saveButton = new Ext.Button
      ui: 'action'
      text: 'Save'
      handler: this.saveButtonTap
      scope: this

    this.topToolbar = new Ext.Toolbar
      title: 'New Place'
      items: [
        this.backButton,
        {xtype: 'spacer'},
        this.saveButton
      ]

    this.dockedItems = [
      this.topToolbar
    ]

    FSApp.views.CheckinListView.superclass.initComponent.call(this)

  backButtonTap: ->
    Ext.dispatch
      controller: FSApp.controllers.placesController
      action: 'backCheckinList'

  saveButtonTap: ->
    Ext.dispatch
      controller: FSApp.controllers.placesController
      action: 'saveplace'

  items: [{
    xtype: 'textfield'
    name: 'name'
    label: 'Name'
    required: true
  }]
})