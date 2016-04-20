var app = angular.module("PackageCatalogApp", ['ui.router', 'app.views', 'hc.marked', 'ngAnimate']); 

app.config(function($stateProvider, $urlRouterProvider) {
  // For any unmatched url, redirect to /state1
  $urlRouterProvider.otherwise("/");
});