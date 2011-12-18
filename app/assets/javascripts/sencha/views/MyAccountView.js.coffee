FSApp.views.MyAccountView = Ext.extend(Ext.Panel, {
  title: 'My Account'
  iconCls: 'user'
  initComponent: ->
    this.addFriendButton = new Ext.Button
      ui: 'action'
      text: 'Add Friend'
      scope: this
      handler: this.addFriendButtonTap

    this.topToolbar = new Ext.Toolbar
      title: 'My Account'
      items: [
        {xtype: 'spacer'},
        this.addFriendButton
      ]

    this.myAccountStatus = new Ext.Panel
      html: '<div>My Account Status</div>'

    this.dockedItems = [
      this.topToolbar,
      this.myAccountStatus
    ]

    FSApp.views.LoginView.superclass.initComponent.call(this)

  addFriendButtonTap: ->
    Ext.dispatch
      controller: FSApp.controllers.myAccountController
      action: 'friends'
})