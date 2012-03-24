#-------------------------------------------------------------------------------
$(document).ready ->
    onLoad()
    
#-------------------------------------------------------------------------------
onLoad = ->
    loadWeather()
    setupMaps()
    
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
            
#-------------------------------------------------------------------------------
setupMaps = ->   
    $(".toggle-map").click ->
        img  = this
        oSrc = img.src
        
        match = oSrc.match /(.*?)-(.)\.png/
        
        return if !match
        
        if match[2] == 'r'
            nSrc = "#{match[1]}-t.png"
        else
            nSrc = "#{match[1]}-r.png"
        
        img.src = nSrc
