Ext.regController('NotesController', {
  'index': (options) ->
    console.log "NotesController: index"
    if !NotesApp.views.mainView
      NotesApp.views.mainView = new NotesApp.views.MainView()

    NotesApp.views.mainView.setActiveItem(
      NotesApp.views.notesListView
    )

  'newnote': (options) ->
    console.log "NotesController: newnote"
    now = new Date()
    noteId = now.getTime()
    note = Ext.ModelMgr.create({id: noteId, created_at: now, title: '', narrative: ''}, 'NoteModel')
    NotesApp.views.noteEditorView.load(note)
    NotesApp.views.mainView.setActiveItem(
      NotesApp.views.noteEditorView,
      {type: 'slide', direction: 'left'}
    )

  'editnote': (options) ->
    console.log "NotesController: editnote"
    NotesApp.views.noteEditorView.load(options.note)
    NotesApp.views.mainView.setActiveItem(
      NotesApp.views.noteEditorView,
      {type: 'slide', direction: 'left'}
    )

  'savenote': (options) ->
    console.log "NotesController: savenote"
    currentNote = NotesApp.views.noteEditorView.getRecord()
    NotesApp.views.noteEditorView.updateRecord(currentNote);
    errors = currentNote.validate()
    if !errors.isValid()
      currentNote.reject()
      Ext.Msg.alert('Wait!', errors.getByField('title')[0].message, Ext.emptyFn)
      return

    unless NotesApp.stores.notesStore.findRecord('id', currentNote.data.id)
      NotesApp.stores.notesStore.add(currentNote)
    else
      currentNote.setDirty()

    NotesApp.stores.notesStore.sync()
    NotesApp.stores.notesStore.sort [{property: 'created_at', direction: 'DESC'}]
    NotesApp.views.notesListView.refreshList()
    NotesApp.views.mainView.setActiveItem(
      NotesApp.views.notesListView,
      {type: 'slide', direction: 'right'}
    )

  'deletenote': (options) ->
    console.log "NotesController: deletenote"
    currentNote = NotesApp.views.noteEditorView.getRecord()
    if NotesApp.stores.notesStore.findRecord('id', currentNote.data.id)
      NotesApp.stores.notesStore.remove(currentNote)

    NotesApp.stores.notesStore.sync()
    NotesApp.views.notesListView.refreshList()

    NotesApp.views.mainView.setActiveItem(
      NotesApp.views.notesListView,
      {type: 'slide', direction: 'right'}
    )

  'canceledit': (options) ->
    console.log "NotesController: canceledit"
    NotesApp.views.mainView.setActiveItem(
      NotesApp.views.notesListView,
      {type: 'slide', direction: 'right'}
    )
})

NotesApp.controllers.notesController = Ext.ControllerManager.get('NotesController')