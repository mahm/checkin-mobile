NotesApp.views.NoteEditorView = Ext.extend(Ext.form.FormPanel, {
  initComponent: ->
    this.backButton = new Ext.Button
      text: 'Home'
      ui: 'back'
      handler: this.backButtonTap
      scope: this

    this.saveButton = new Ext.Button
      text: 'Save'
      ui: 'action'
      handler: this.saveButtonTap
      scope: this

    this.trashButton = new Ext.Button
      iconCls: 'trash'
      iconMask: true
      handler: this.trashButtonTap
      scope: this

    this.topToolbar = new Ext.Toolbar
      title: 'Edit Note'
      items: [
        this.backButton,
        { xtype: 'spacer' },
        this.saveButton
      ]

    this.bottomToolbar = new Ext.Toolbar
      dock: 'bottom'
      items: [
          { xtype: 'spacer' },
          this.trashButton
      ]

    this.dockedItems = [this.topToolbar, this.bottomToolbar];

    NotesApp.views.NoteEditorView.superclass.initComponent.call(this);

  backButtonTap: ->
    Ext.dispatch
      controller: NotesApp.controllers.notesController
      action: 'canceledit'

  saveButtonTap: ->
    Ext.dispatch
      controller: NotesApp.controllers.notesController
      action: 'savenote'

  trashButtonTap: ->
    Ext.dispatch
      controller: NotesApp.controllers.notesController
      action: 'deletenote'

  items: [{
      xtype: 'textfield'
      name: 'title'
      label: 'Title'
      required: true
  }, {
      xtype: 'textareafield'
      name: 'narrative'
      label: 'Narrative'
  }]
})