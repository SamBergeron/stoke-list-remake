'use strict'

###*
 # @ngdoc service
 # @name stokeRemakeApp.Feeder
 # @description
 # # Feeder
 # Service in the stokeRemakeApp.
###
angular.module 'stokeRemakeApp'
  .factory 'Feeder', ($q, $log)->

    getFeed: (url, entryNumber) ->
      deffered = $q.defer()

      feed = new google.feeds.Feed(url)
      feed.setNumEntries(entryNumber)
      feed.load (result) ->
        if !result.error
          deffered.resolve(result.feed)
          $log.log(result.feed)
        else
          deffered.reject()
          $log.log('There was an error with the feed')
          $log.log(result)

      return deffered.promise
