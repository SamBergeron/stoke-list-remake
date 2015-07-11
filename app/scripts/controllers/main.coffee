'use strict'

###*
 # @ngdoc function
 # @name stokeRemakeApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the stokeRemakeApp
###
angular.module 'stokeRemakeApp'
  .controller 'MainCtrl', ($scope, $log, Feeder)->

    stokePostUrl = 'http://list.thestoke.ca/posts.rss'
    $scope.entryNumber = 50

    getPostId = (postUrl) ->
      re = /[0-9]{1,}/
      return re.exec(postUrl)

    $scope.refreshFeed = (num) ->
      $scope.entryNumber = num
      feedPromise = Feeder.getFeed(stokePostUrl, $scope.entryNumber)
      feedPromise.then(
        (feed) ->
          $scope.entries = feed.entries
          for entry in feed.entries
            postId = getPostId(entry.link)
            entry.thumbUrl = 'http://list.thestoke.ca/photos/' + postId + '/thumb.jpg'
            entry.mail = 'list+' + postId + '@thestoke.ca'
        , (failure) ->
          $log.error('Could not get feed entries')
        )

    #Initialize the feed with 50 posts
    $scope.refreshFeed($scope.entryNumber)
