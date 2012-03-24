Log     = []
LogList = null

#-------------------------------------------------------------------------------
$(document).ready ->
    loadWeather()
    setupMaps()
    setupLog()
    setupAppCache()
    
    LogAdd "starting!"

#-------------------------------------------------------------------------------
setupAppCache = ->    
    return if !window.applicationCache
    
    applicationCache.addEventListener "updateready", appCacheUpdateReady, false
    
#-------------------------------------------------------------------------------
appCacheUpdateReady ->
   if applicationCache.status == applicationCache.UPDATEREADY
       applicationCache.swapCache()
       
       alert 'The weather has been updated!'
       location.reload()

#-------------------------------------------------------------------------------
setupLog = ->    

    $("#log-clear").click -> logClear()
    
    window.LogAdd   = logAdd
    
    Log     = []
    LogList = $("#log-list")
    
    return if !window.localStorage
    
    logJson = localStorage.Log || "[]"
    
    Log = JSON.parse logJson
    
    for entry in Log
        LogList.append "<li>#{entry}"
        
    LogList.listview('refresh')

#-------------------------------------------------------------------------------
logAdd = (message) ->
    # new Date()
    
    entry1 = "#{new Date()}:"
    entry2 = "#{message}"
    
    Log.unshift entry2
    Log.unshift entry1
    
    LogList.prepend "<li>#{entry2}"
    LogList.prepend "<li>#{entry1}"
    LogList.listview('refresh')

    return if !window.localStorage
    
    localStorage.Log = JSON.stringify(Log, null, 2)

#-------------------------------------------------------------------------------
logClear = ->

    Log = []
    LogList.html ""

    return if !window.localStorage

    localStorage.Log = "[]"
    
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
