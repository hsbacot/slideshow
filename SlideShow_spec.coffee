describe 'Slideshow', () ->
  slideshow = {}
  beforeEach ->
    slideshow = new SlideShow()
    slideshow.slides[0] =
      caption: "this is a caption"
      image: "test.jpg"
      link: "http://designspiration.net/"
      name: "first slide"
    slideshow.slides[1] =
      caption: "this is a caption"
      image: "test2.jpg"
      link: "http://nettheory.com/"
      name: "second slide"

  it 'should be able to go the the next slide', () ->
    slideshow.slideIndex = 0
    slideshow.next_slide()
    index = slideshow.slideIndex
    expect(index).toBe 1

  it 'should have a caption with each slide', () ->
    expect(slideshow.slides[0]['caption']).toBe "this is a caption"

  it 'should return to the first slide if at the last position', () ->
    slideshow.slideIndex = 1
    slideshow.next_slide()
    index = slideshow.slideIndex
    expect(index).toBe 0

  it 'should be able to set the current index', () ->
    slideshow.set_index(1)
    expect(slideshow.slideIndex).toBe 1