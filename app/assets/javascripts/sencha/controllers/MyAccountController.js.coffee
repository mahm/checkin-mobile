Ext.regController('MyAccountController', {
  'show': (options) ->
    console.log "MyAccountController: show"
    FSApp.views.myAccountView.refreshList()
    FSApp.views.mainView.setActiveItem(
      FSApp.views.myAccountView,
      {type: 'slide', direction: options.direction}
    )
  'friends': (options) ->
    console.log "MyAccountController: friends"
    FSApp.views.addFriendView.addableFriendStore.load()
    FSApp.views.mainView.setActiveItem(
      FSApp.views.addFriendView,
      {type: 'slide', direction: 'left'}
    )
  'addFriend': (options) ->
    console.log "MyAccountController: addFriend"
    Ext.Ajax.request
      url: 'friends.json'
      method: 'post'
      params: options.friend.data
    # フレンドリストを更新
    FSApp.views.mainView.setActiveItem(
      FSApp.views.myAccountView,
      {type: 'slide', direction: 'right'}
    )
    # メッセージの出力
    Ext.Msg.alert('PoPoPoPo--N!', options.friend.data.name + ' becomes your friend!');
})

FSApp.controllers.myAccountController = Ext.ControllerManager.get('MyAccountController')