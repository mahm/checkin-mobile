Ext.regController('LoginController', {
  'login': (options) ->
    console.log "LoginController: login"
    FSApp.views.mainView.setActiveItem(
      FSApp.views.loginView,
      {type: 'slide', direction: 'up'}
    )
})

FSApp.controllers.loginController = Ext.ControllerManager.get('LoginController')