window.Location = class Location

  constructor: (args) ->
    if (navigator.geolocation)
      navigator.geolocation.getCurrentPosition (position) ->
        console.log(position.coords.latitude)
        console.log(position.coords.longitude)

        $.ajax({
          type: "POST",
          url: "/root",
          dataType: "json",
          data: {
            latitude: position.coords.latitude,
            longitude: position.coords.longitude  
          }
        })
    else
      alert("I'm sorry, but geolocation services are not supported by your browser.");  
