$ ->
  slideshow = new SlideShow

  $("#main-slideshow .slide").each (index) ->
    image = $(this).find(".slide-image").attr("src")
    name = $(this).find(".slide-title").text()
    caption = $(this).find(".caption").text()
    link = $(this).find(".link").attr("href")
    linkText = $(this).find(".link").text()
    console.log index + " " + caption + " " + link + linkText
    slide =
      image: image
      caption: caption
      link: link
      linkText: linkText
      name: name
    slideshow.slides.push slide
    console.log slideshow
    console.log slideshow.slides[0]['image']

  # call when data is gathered
  slideCounter = 0
  slideDots = []
  while slideCounter < slideshow.slides.length
    slideDots.push " <span class='slide-dot' data-index='#{slideCounter}'>&#9679;</span> "
    slideCounter++

  unless slideshow.slides.length == 0
    $("#main-slideshow").css("background-image", "url(#{slideshow.slides[0]['image']})")
    $("#main-slideshow").empty()
    $("#main-slideshow").append $("<h2 class='slide-title'></h2>")
    $("#main-slideshow").append $("<p class='caption'></p>")
    $("#main-slideshow").append $("<a href='' class='link'></a>")
    $("#main-slideshow").append $("<div class='slide-nav'>#{slideDots.join('').toString()}</div>")
    slideshow.set_slide_values()

  # Change slide on keypress
  # window.addEventListener "keypress", (e) ->
  #   slideshow.next_slide()
  $("#my-mini-cart-link").click ->
    $("#my-mini-cart").toggle()
    
  
  rotate = setInterval () ->
        slideshow.next_slide()
      , 5 * 1000

  $(".slide-dot").click ->
    slideshow.set_index($(this).attr('data-index'))
    $(".slide-dot").remove
    clearInterval(rotate)
    rotate = setInterval () ->
        slideshow.next_slide()
      , 5 * 1000
    
## END DOCUMENT ON READY

class window.SlideShow
  # constructor: () ->
  slideIndex: 0
  slides: []

  next_slide: () ->
    if @slideIndex < @slides.length - 1
      @slideIndex++
    else
      @slideIndex = 0
    # set the values
    this.set_slide_values()

  set_index: (index) ->
    @slideIndex = index
    this.set_slide_values()

  set_slide_values: ->
    $("#main-slideshow").css("background-image", "url(#{@slides[@slideIndex]['image']})")
    $("#main-slideshow").find(".slide-title").text("#{@slides[@slideIndex]['name']}")
    $("#main-slideshow").find(".caption").text("#{@slides[@slideIndex]['caption']}")
    $("#main-slideshow").find(".link").text("#{@slides[@slideIndex]['linkText']}")
    $("#main-slideshow").find(".link").attr('href', "#{@slides[@slideIndex]['link']}")
    $("#main-slideshow").find(".slide-dot").removeClass("active")
    $("#main-slideshow .slide-nav").find("*[data-index=#{@slideIndex}]").addClass("active")

