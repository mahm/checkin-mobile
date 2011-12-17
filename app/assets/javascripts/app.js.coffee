App = new Ext.Application
  name: 'FSApp'
  useLoadMask: true

  launch: ->
    Ext.dispatch
      controller: FSApp.controllers.friendTimelineController
      action: 'index'
