window.Lunch = class Lunch

  constructor: (args) ->
    @businesses = []
    @count = 0

    if (navigator.geolocation)
      navigator.geolocation.getCurrentPosition (position) =>
        $.ajax({
          type: "POST",
          url: "/root",
          dataType: "json",
          data: {
            latitude: position.coords.latitude,
            longitude: position.coords.longitude  
          },
          success: (data) =>
            @businesses = (new Business(business.name, business.url) for business in data)
            @addToView()
        })
    else
      alert("I'm sorry, but geolocation services are not supported by your browser.");
    
  addToView: ->
    business = @businesses[@count]
    view = {
      name: business.name,
      url: business.url
    }

    template = "<h1><a href='{{url}}' target='_blank'>{{name}}</a></h1>"

    html = Mustache.to_html(template, view)
    $('article h1').replaceWith(html)
    $('.container').show()
  
  suggestion: ->
    @count++
    @addToView()