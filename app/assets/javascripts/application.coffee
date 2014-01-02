# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require angular
#= require angular-route
#= require angular-resource
#= require angular-sanitize
#= require hamlcoffee
#= require_tree .


angular.module("godock", ['ngRoute', 'ngResource', 'ngSanitize'])
  .factory "Library", ($resource) ->
    $resource("/libraries/:id")

  .factory "Namespace", ($resource) ->
    $resource("/namespaces/:ns")

  .factory "Function", ($resource) ->
    $resource("/functions/:fn")

  .factory "TypeClass", ($resource) ->
    $resource("/type_classes/:type_class")

  .controller "LibraryCntl", @LibraryCntl = ($scope, Library) ->
    $scope.lib = Library.get(id:3)

  .controller "NamespaceCntl", @NamespaceCntl = ($scope, $routeParams, Namespace) ->
    $scope.namespace = Namespace.get($routeParams)

  .controller "FunctionCntl", @FunctionCntl = ($scope, $routeParams, Namespace, Function) ->
    $scope.function = Function.get($routeParams)
    $scope.namespace = Namespace.get($routeParams)

  .controller "TypeClassCntl", @TypeClassCntl = ($scope, $routeParams, Namespace, TypeClass) ->
    $scope.type_class = TypeClass.get($routeParams)
    $scope.namespace = Namespace.get($routeParams)

  .config ($routeProvider) ->
    $routeProvider.when "/:ns.:fn",
      template: JST["function"]
      controller: FunctionCntl


    $routeProvider.when "/:ns",
      template: JST["namespace"]
      controller: NamespaceCntl

    $routeProvider.when "/:ns/:type_class.:fn",
      template: JST["type_class"]
      controller: TypeClassCntl
      
    $routeProvider.when "/:ns/:type_class",
      template: JST["type_class"]
      controller: TypeClassCntl
