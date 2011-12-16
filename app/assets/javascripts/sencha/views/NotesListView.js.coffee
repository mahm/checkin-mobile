NotesApp.views.NotesListView = Ext.extend(Ext.Panel, {
  notesStore: Ext.emptyFn
  notesList: Ext.emptyFn
  layout: 'fit'
  initComponent: ->
    this.newButton = new Ext.Button
      text: 'new'
      ui: 'action'
      handler: this.onNewNote
      scope: this

    this.topToolbar = new Ext.Toolbar
      title: 'My Notes'
      items: [
        { xtype: 'spacer' },
        this.newButton
      ]

    this.dockedItems = [this.topToolbar]

    this.notesList = new Ext.List
      store: this.notesStore
      grouped: true
      emptyText: '<div style="margin:5px;">No notes cached.</div>'
      onItemDisclosure: true
      itemTpl: '<div class="list-item-title">{title}</div><div class="list-item-narrative">{narrative}</div>'

    this.notesList.on('disclose', (record, index, evt) ->
      this.onEditNote(record, index)
    , this)

    this.items = [this.notesList]
    NotesApp.views.NotesListView.superclass.initComponent.call(this)

  onNewNote: ->
    Ext.dispatch
      controller: NotesApp.controllers.notesController
      action: 'newnote'

  onEditNote: (record, index) ->
    Ext.dispatch
      controller: NotesApp.controllers.notesController
      action: 'editnote'
      note: record

  refreshList: ->
    this.notesList.refresh()
})