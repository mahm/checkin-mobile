FSApp.views.LoginView = Ext.extend(Ext.Panel, {
  initComponent: ->
    this.topToolbar = new Ext.Toolbar
      title: 'foursquare login'

    this.needLoginPanel = new Ext.Panel
      html: '<div class="you-need-login">You need login</div>'

    this.loginFacebookButton = new Ext.Button
      ui: 'action'
      text: 'login with facebook'
      handler: this.facebookButtonTap
      scope: this

    this.dockedItems = [
      this.topToolbar,
      this.needLoginPanel,
      this.loginFacebookButton
    ]

    FSApp.views.LoginView.superclass.initComponent.call(this)

  facebookButtonTap: ->
    window.location.href = "/auth/facebook"
})