'use strict'

###*
 # @ngdoc directive
 # @name stokeRemakeApp.directive:errSrc
 # @description
 # # errSrc
###
angular.module 'stokeRemakeApp'
  .directive 'errSrc', ->
    link: (scope, element, attrs) ->
      element.bind('error', () ->
        if attrs.src != attrs.errSrc
          attrs.$set('src', attrs.errSrc)
        )
