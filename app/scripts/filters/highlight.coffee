'use strict'

###*
 # @ngdoc filter
 # @name stokeRemakeApp.filter:highlight
 # @function
 # @description
 # # highlight
 # Filter in the stokeRemakeApp.
###
angular.module 'stokeRemakeApp'
  .filter 'highlight', ($sce)->
    return (text, phrase) ->
      text = text.replace(new RegExp('('+phrase+')', 'gi'), '<span class="highlighted">$1</span>')
      return $sce.trustAsHtml(text)
