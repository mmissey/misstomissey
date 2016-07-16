angular.module 'misstomissey'
  .directive 'bridalparty', [ '$timeout', ($timeout) ->

    PartyController = () ->
      party = this
      party.slides = [
        {
            name: "Ella Kurczewski"
            title: "Matron of Honor"
            img: "/assets/images/ella.jpg"
            blurb: "blah blah slide 1"
        },
        {
            name: "Josh Holtgreive"
            title: "Best Man"
            img: "/assets/images/josh.jpg"
            blurb: "blah blah slide 1"
        },
        {
            name: "Rachel Wayne"
            title: "Maid of Honor"
            img: "/assets/images/rachel.jpg"
            blurb: "blah blah slide 1"
        },
        {
            name: "Brian Knecht"
            title: "Groomsman"
            img: "/assets/images/brian.png"
            blurb: "blah blah slide 1"
        },
        {
            name: "Stephanie Missey"
            title: "Bridesmaid"
            img: "/assets/images/steph.jpg"
            blurb: "blah blah slide 1"
        },
        {
            name: "Brandon Evans"
            title: "Groomsman"
            img: "/assets/images/brandon.jpg"
            blurb: "blah blah slide 1"
        }
      ]
      party.prevSlideElm = document.getElementById("party-prevSlide")
      party.nextSlideElm = document.getElementById("party-nextSlide")
      party.activeSlideElm = document.getElementById("party-activeSlide")

      party.activeSlideIndex = 0;

      party.changeRate = if(window.innerWidth > 792) then  2 else 1;

      party.updateSlides = () ->
        party.activeSlide = party.slides[party.activeSlideIndex]
        party.activeSlideRight = party.slides[party.activeSlideIndex+1];
        party.previousSlide = party.slides[party.getPrev()]
        party.previousSlideRight  = party.slides[party.getPrev()+1]
        party.nextSlide = party.slides[party.getNext()]
        party.nextSlideRight = party.slides[party.getNext()+1]
      party.getPrev = () ->
        if party.activeSlideIndex > 0 then party.activeSlideIndex-party.changeRate else party.slides.length-party.changeRate

      party.getNext = () ->
        if party.activeSlideIndex < party.slides.length-party.changeRate then party.activeSlideIndex+party.changeRate else 0

      party.goNext = () ->
        return if party.sliding
        party.sliding = true
        party.activeSlideIndex = party.getNext()
        party.activeSlideElm.classList.add("slidingLeft")
        party.nextSlideElm.classList.add("slidingLeft")
        $timeout ->
          party.activeSlideElm.classList.remove("slidingLeft")
          party.nextSlideElm.classList.remove("slidingLeft")
          party.updateSlides()
          party.sliding = false
        , 1000

      party.goPrev = () ->
        return if party.sliding
        party.sliding = true
        party.activeSlideIndex = party.getPrev()
        party.activeSlideElm.classList.add("slidingRight")
        party.prevSlideElm.classList.add("slidingRight")
        $timeout ->
          party.activeSlideElm.classList.remove("slidingRight")
          party.prevSlideElm.classList.remove("slidingRight")
          party.updateSlides()
          party.sliding = false
        , 1000

      party.updateSlides()


      #party.startTimer();
      return

    directive =
      restrict: 'E'
      templateUrl: 'app/components/bridalparty/bridalparty.html'
      scope: {}
      controller: PartyController
      controllerAs: 'party'
      bindToController: true

]