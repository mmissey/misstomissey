angular.module 'misstomissey'
  .directive 'navbar', ['$location', '$anchorScroll', ($location, $anchorScroll)  ->

    NavbarController = ->
      vm = this
      vm.tab = 0


      vm.goTo = (newHash) ->
        if ($location.hash() isnt newHash)
          $location.hash(newHash)
        else
          $anchorScroll()
      

      return

    directive =
      restrict: 'E'
      templateUrl: 'app/components/navbar/navbar.html'
      scope: {}
      controller: NavbarController
      controllerAs: 'vm'
      bindToController: true
  ]