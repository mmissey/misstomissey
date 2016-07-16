angular.module 'misstomissey'
  .config ($locationProvider, $logProvider) ->
    'ngInject'
    $locationProvider.html5Mode({
    	enabled: true
    	requireBase: false
    })
    # Enable log
    $logProvider.debugEnabled true
