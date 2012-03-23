#-------------------------------------------------------------------------------
$(document).ready ->
    onLoad()
    
#-------------------------------------------------------------------------------
onLoad = ->
    loadWeather()
    
#-------------------------------------------------------------------------------
loadWeather = ->    
    for fileName, content of Weather
        [ignore, zip, type] = fileName.match /(.*?)-(.*?)\./
        
        fid = "weather-forecast-#{zip}"
        did = "weather-discuss-#{zip}"
        
        if type == 'forecast'
            $('#' + "weather-forecast-#{zip}").html(content)

        if type == 'discussion'
            $('#' + "weather-discuss-#{zip}").html(content)
            
            
 
# "84764-discussion.html": "...",
# "84764-forecast.html": "...",

# <div id="weather-forecast-86023"></div>
# <p><img src="weather/86023-00.png" width="100%">
# <p><img src="weather/86023-48.png" width="100%">
# <div id="weather-discuss-86023"></div>
        
