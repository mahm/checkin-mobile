App = new Ext.Application
  name: 'NotesApp'
  useLoadMask: true

  launch: ->
    Ext.dispatch
      controller: NotesApp.controllers.notesController
      action: 'index'
