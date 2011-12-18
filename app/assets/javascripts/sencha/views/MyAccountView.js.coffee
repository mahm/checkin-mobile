FSApp.views.MyAccountView = Ext.extend(Ext.Panel, {
  title: 'Friends'
  iconCls: 'team'
  friendList: Ext.emptyFn
  friendStore: Ext.emptyFn
  initComponent: ->
    this.addFriendButton = new Ext.Button
      ui: 'action'
      text: 'Invite Friend'
      scope: this
      handler: this.addFriendButtonTap

    this.topToolbar = new Ext.Toolbar
      title: 'My Friends'
      items: [
        {xtype: 'spacer'},
        this.addFriendButton
      ]

    this.friendList = new Ext.List
      store: this.friendStore
      emptyText: '<div>Let\'s invite your friends</div>'
      itemTpl: '<div>{name}</div>'
      plugins: [{
        ptype: 'pullrefresh'
      }]

    this.dockedItems = [
      this.topToolbar,
      this.friendList
    ]

    this.listeners = {
      activate: ->
        Ext.dispatch
          controller: FSApp.controllers.myAccountController
          action: 'show'
          direction: 'left'
    }
    FSApp.views.MyAccountView.superclass.initComponent.call(this)

  refreshList: ->
    FSApp.stores.friendStore.load()
    FSApp.views.myAccountView.friendList.update()

  addFriendButtonTap: ->
    Ext.dispatch
      controller: FSApp.controllers.myAccountController
      action: 'friends'
})