window.Lunch = class Lunch

  constructor: (args) ->
    if (navigator.geolocation)
      navigator.geolocation.getCurrentPosition (position) ->
        $.ajax({
          type: "POST",
          url: "/root",
          dataType: "json",
          data: {
            latitude: position.coords.latitude,
            longitude: position.coords.longitude  
          },
          success: (data) ->
            @businesses = (new Business(business.name, business.url) for business in data)
        })
    else
      alert("I'm sorry, but geolocation services are not supported by your browser.");  
