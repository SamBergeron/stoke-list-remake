'use strict'

###*
 # @ngdoc overview
 # @name stokeRemakeApp
 # @description
 # # stokeRemakeApp
 #
 # Main module of the application.
###
angular
  .module 'stokeRemakeApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'ui.bootstrap'
  ]
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
        controllerAs: 'main'
      .otherwise
        redirectTo: '/'
