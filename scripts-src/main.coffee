Log     = []
LogList = null

#-------------------------------------------------------------------------------
window.LogAdd = (message) ->
    setTimeout (-> window.LogAdd(message)), 1000

#-------------------------------------------------------------------------------
$(document).ready ->
    loadWeather()
    setupMaps()
    setupAppCache()
    
    $.mobile.defaultPageTransition = "none"

$("#page-log").live "pageinit", ->
    setupLog()

#-------------------------------------------------------------------------------
setupAppCache = ->    
    return if !window.applicationCache
    
    applicationCache.addEventListener "updateready", appCacheUpdateReady, false
    applicationCache.addEventListener "downloading", appCacheDownloading, false
    applicationCache.addEventListener "error",       appCacheError, false
    applicationCache.addEventListener "obsolete",    appCacheObsolete, false
    
    try 
        applicationCache.update()
    catch e
        LogAdd "error updating cache" if window.LogAdd
    
#-------------------------------------------------------------------------------
appCacheUpdateReady = ->
    applicationCache.swapCache()

    LogAdd "appcache updated"
   
    alert 'The weather has been updated!'
    location.reload()
    
#-------------------------------------------------------------------------------
appCacheDownloading = ->
    LogAdd "appcache downloading"
    
#-------------------------------------------------------------------------------
appCacheError = ->
    LogAdd "appcache error"
    
#-------------------------------------------------------------------------------
appCacheObsolete = ->
    LogAdd "appcache obsolete"

#-------------------------------------------------------------------------------
setupLog = ->    

    $("#log-clear").click -> logClear()
    
    window.LogAdd = logAdd
    
    Log     = []
    LogList = $("#log-list")
    
    return if !window.localStorage
    
    logJson = localStorage.getItem "Log"
    logJson = logJson || "[]"
    
    Log = JSON.parse logJson
    
    for entry in Log
        LogList.append "<li>#{entry}"
        
    LogList.listview('refresh')

#-------------------------------------------------------------------------------
logAdd = (message) ->
    # new Date()
    
    return if !window.LogAdd
    
    entry1 = "#{new Date()}:"
    entry2 = "#{message}"
    
    Log.unshift entry2
    Log.unshift entry1
    
    LogList.prepend "<li>#{entry2}"
    LogList.prepend "<li>#{entry1}"
    LogList.listview('refresh')

    return if !window.localStorage
    
    localStorage.setItem "Log", JSON.stringify(Log, null, 2)

#-------------------------------------------------------------------------------
logClear = ->

    return if !window.LogAdd

    Log = []
    LogList.html ""

    return if !window.localStorage

    localStorage.setItem "Log", "[]"
    
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
