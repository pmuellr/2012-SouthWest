var Log, LogList, loadWeather, logAdd, logClear, setupAppCache, setupLog, setupMaps;

Log = [];

LogList = null;

$(document).ready(function() {
  loadWeather();
  setupMaps();
  setupLog();
  setupAppCache();
  return LogAdd("starting!");
});

setupAppCache = function() {
  if (!window.applicationCache) return;
  return applicationCache.addEventListener("updateready", appCacheUpdateReady, false);
};

appCacheUpdateReady(function() {
  if (applicationCache.status === applicationCache.UPDATEREADY) {
    applicationCache.swapCache();
    alert('The weather has been updated!');
    return location.reload();
  }
});

setupLog = function() {
  var entry, logJson, _i, _len;
  $("#log-clear").click(function() {
    return logClear();
  });
  window.LogAdd = logAdd;
  Log = [];
  LogList = $("#log-list");
  if (!window.localStorage) return;
  logJson = localStorage.Log || "[]";
  Log = JSON.parse(logJson);
  for (_i = 0, _len = Log.length; _i < _len; _i++) {
    entry = Log[_i];
    LogList.append("<li>" + entry);
  }
  return LogList.listview('refresh');
};

logAdd = function(message) {
  var entry1, entry2;
  entry1 = "" + (new Date()) + ":";
  entry2 = "" + message;
  Log.unshift(entry2);
  Log.unshift(entry1);
  LogList.prepend("<li>" + entry2);
  LogList.prepend("<li>" + entry1);
  LogList.listview('refresh');
  if (!window.localStorage) return;
  return localStorage.Log = JSON.stringify(Log, null, 2);
};

logClear = function() {
  Log = [];
  LogList.html("");
  if (!window.localStorage) return;
  return localStorage.Log = "[]";
};

loadWeather = function() {
  var content, did, fid, fileName, ignore, type, zip, _ref, _results;
  _results = [];
  for (fileName in Weather) {
    content = Weather[fileName];
    _ref = fileName.match(/(.*?)-(.*?)\./), ignore = _ref[0], zip = _ref[1], type = _ref[2];
    fid = "weather-forecast-" + zip;
    did = "weather-discuss-" + zip;
    if (type === 'forecast') $('#' + ("weather-forecast-" + zip)).html(content);
    if (type === 'discussion') {
      _results.push($('#' + ("weather-discuss-" + zip)).html(content));
    } else {
      _results.push(void 0);
    }
  }
  return _results;
};

setupMaps = function() {
  return $(".toggle-map").click(function() {
    var img, match, nSrc, oSrc;
    img = this;
    oSrc = img.src;
    match = oSrc.match(/(.*?)-(.)\.png/);
    if (!match) return;
    if (match[2] === 'r') {
      nSrc = "" + match[1] + "-t.png";
    } else {
      nSrc = "" + match[1] + "-r.png";
    }
    return img.src = nSrc;
  });
};
