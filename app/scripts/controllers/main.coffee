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

    getPostId = (postUrl) ->
      re = /[0-9]{1,}/
      return re.exec(postUrl)

    $scope.errUrl = '/images/placeholder.png'

    $scope.openAll = false
    $scope.openOrClose = 'Open'
    $scope.toggleOpenAll = () ->
      $scope.openAll = !$scope.openAll
      if($scope.openAll)
        $scope.openOrClose = 'Close'
      else $scope.openOrClose = 'Open'

    $scope.tooltipText = 'This will only affect the boxes you haven\'t touched yet!'

    $scope.refreshFeed = (num) ->
      feedPromise = Feeder.getFeed(stokePostUrl, num)
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
    $scope.refreshFeed(50)

    $scope.$watch('filteredEntries', ()->
      $log.info($scope.filteredEntries)
      )
