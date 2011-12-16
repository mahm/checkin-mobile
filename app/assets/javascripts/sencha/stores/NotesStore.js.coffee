Ext.regStore 'NotesStore',
  model: 'NoteModel'

  sorters: [
    property: 'created_at'
    direction: 'DESC'
  ]

  proxy:
    type: 'ajax'
    url: 'notes.json'
    reader:
      type: 'json'

  autoLoad: true

  getGroupString: (record) ->
    if record && record.data.created_at
      return record.get('created_at').toDateString()
    else
      return ''

NotesApp.stores.notesStore = Ext.StoreMgr.get('NotesStore')
