Ext.regModel 'NoteModel'
  idProperty: 'id'
  fields: [
    {name: 'id', type: 'int'},
    {name: 'created_at', type: 'date', dateFormat: 'c'},
    {name: 'title', type: 'string'},
    {name: 'narrative', type: 'string'}
  ],
  validations: [
    {type: 'presence', field: 'id'},
    {type: 'presence', field: 'title', message: 'Please enter a title for this note.'}
  ]
