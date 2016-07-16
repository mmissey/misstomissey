angular.module 'misstomissey'
  .directive 'ourstory', [ '$timeout', ($timeout) ->

    OurStoryController = () ->
      vm = this
      vm.slides = [
        {
          bg: "/assets/images/siue.jpg"
          blurb: "In 2007, Marc and Bridget were freshman at SIUE...living in the same wing...of the same dorm. They lived in a really fun wing, so everyone loved hanging out together and making friends. While the rest of the group ate most of their dinners together, Bridget would eat her meals with her older sister, Ella, who was a sophomore. Marc had seen Bridget around and thought she was really cute, so to get her attention Marc would yell Bridget’s name across the cafeteria to get her to sit by him. It was really cute and Bridget would be lying if she said she didn’t like the attention. Things just kinda clicked at a party they both were at in Edwardsville. They’ll save you from the rest of those boring details…"
          year: "2007"
        },
        {
          bg: "/assets/images/sf.jpg"
          blurb: "Fast forward to 2011, when Marc and Bridget were seniors in college. They wanted to go somewhere for spring break, and while going to Panama City would have been a lot of fun they decided to go to San Francisco instead. They both knew they didn’t want to stay in St. Louis after graduating, so checking out the tech scene in SF was a must for Marc. And Bridget was enjoying being along for the ride. Long story short, but they fell in love with the City by the Bay (never San Fran and never ever Frisco!) and moved out there after Marc graduated that summer. They learned a whole lot of life lessons along the way and a whole lot about each other. They spent 4.5 fantastic years in the Bay Area and they left a piece of their hearts there."
          year: "2011"
        },
        {
          bg: "/assets/images/denver.jpg"
          blurb: "In 2015, 8 years into their relationship, Marc and Bridget were starting to feel antsy. They were sick of apartment life and they were sick of those Bay Area rent prices. They started talking about moving and Denver was at the top of the list. Once they got serious about that idea, things started moving pretty quickly. They had also been talking, mostly on Bridget’s part, about getting engaged. After several years of taking hints, Marc planned a day in Napa for he and Bridget. Bridget didn’t think anything of it because 1. why would she ever say no to a trip to Napa? and 2. since they were soon moving, who know’s when they will get to come back. Marc completely surprised her by popping the question at their favorite winery, Cuvaison. It was perfect and unforgettable. About a month later, they packed up and moved to Denver where they are going to live happily ever after."
          year: "2015"
        }
      ]
      vm.prevSlideElm = document.getElementById("prevSlide")
      vm.nextSlideElm = document.getElementById("nextSlide")
      vm.activeSlideElm = document.getElementById("activeSlide")

      vm.activeSlideIndex = 0

      vm.updateSlides = () ->
        vm.activeSlide = vm.slides[vm.activeSlideIndex]
        vm.previousSlide = vm.slides[vm.getPrev()]
        vm.nextSlide = vm.slides[vm.getNext()]

      vm.getPrev = () ->
        if vm.activeSlideIndex > 0 then vm.activeSlideIndex-1 else vm.slides.length-1

      vm.getNext = () ->
        if vm.activeSlideIndex < vm.slides.length-1 then vm.activeSlideIndex+1 else 0


      vm.goNext = () ->
        return if vm.sliding
        vm.sliding = true
        vm.activeSlideIndex = vm.getNext()
        vm.activeSlideElm.classList.add("slidingLeft")
        vm.nextSlideElm.classList.add("slidingLeft")
        $timeout ->
          vm.activeSlideElm.classList.remove("slidingLeft")
          vm.nextSlideElm.classList.remove("slidingLeft")
          vm.updateSlides()
          vm.sliding = false
        , 1000

      vm.goPrev = () ->
        return if vm.sliding
        vm.sliding = true
        vm.activeSlideIndex = vm.getPrev()
        vm.activeSlideElm.classList.add("slidingRight")
        vm.prevSlideElm.classList.add("slidingRight")
        $timeout ->
          vm.activeSlideElm.classList.remove("slidingRight")
          vm.prevSlideElm.classList.remove("slidingRight")
          vm.updateSlides()
          vm.sliding = false
        , 1000

      vm.updateSlides()

      $timeout ->
        window.sparkle();  

      #vm.startTimer();
      return

    directive =
      restrict: 'E'
      templateUrl: 'app/components/ourstory/ourstory.html'
      scope: {}
      controller: OurStoryController
      controllerAs: 'vm'
      bindToController: true

]