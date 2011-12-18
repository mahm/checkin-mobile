FSApp.views.AddFriendView = Ext.extend(Ext.Panel, {
  title: 'My Account'
  iconCls: 'user'
  addableFriendStore: Ext.emptyFn
  addableFriend: Ext.emptyFn
  initComponent: ->
    this.backButton = new Ext.Button
      ui: 'back'
      text: 'My Account'
      scope: this
      handler: this.backButtonTap

    this.topToolbar = new Ext.Toolbar
      title: 'Add Friend'
      items: [
        this.backButton,
        {xtype: 'spacer'}
      ]

    this.addableFriend = new Ext.List
      store: this.addableFriendStore
      emptyText: '<div>Oh...Stand Alone...</div>'
      itemTpl: '<div>{name}</div>'
      onItemDisclosure: true
      plugins: [
        {ptype: 'pullrefresh'}
      ]

    this.addableFriend.on('disclose', (record, index, evt) ->
      this.addFriendTap(record, index)
    , this)

    this.dockedItems = [
      this.topToolbar
    ]
    this.items = [
      this.addableFriend
    ]

    FSApp.views.AddFriendView.superclass.initComponent.call(this)

  backButtonTap: ->
    Ext.dispatch
      controller: FSApp.controllers.myAccountController
      action: 'backmyaccount'

  addFriendTap: (record, index) ->
    Ext.dispatch
      controller: FSApp.controllers.myAccountController
      action: 'addFriend'
      friend: record

})