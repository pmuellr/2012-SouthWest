var Log, LogList, appCacheDownloading, appCacheError, appCacheObsolete, appCacheUpdateReady, loadWeather, logAdd, logClear, setupAppCache, setupLog, setupMaps;

Log = [];

LogList = null;

window.LogAdd = function(message) {
  return setTimeout((function() {
    return window.LogAdd(message);
  }), 1000);
};

$(document).ready(function() {
  loadWeather();
  setupMaps();
  setupAppCache();
  return $.mobile.defaultPageTransition = "none";
});

$("#page-log").live("pageinit", function() {
  return setupLog();
});

setupAppCache = function() {
  if (!window.applicationCache) return;
  applicationCache.addEventListener("updateready", appCacheUpdateReady, false);
  applicationCache.addEventListener("downloading", appCacheDownloading, false);
  applicationCache.addEventListener("error", appCacheError, false);
  applicationCache.addEventListener("obsolete", appCacheObsolete, false);
  try {
    return applicationCache.update();
  } catch (e) {
    if (window.LogAdd) return LogAdd("error updating cache");
  }
};

appCacheUpdateReady = function() {
  applicationCache.swapCache();
  return LogAdd("appcache updated");
};

appCacheDownloading = function() {
  return LogAdd("appcache downloading");
};

appCacheError = function() {
  return LogAdd("appcache error");
};

appCacheObsolete = function() {
  return LogAdd("appcache obsolete");
};

setupLog = function() {
  var entry, logJson, _i, _len;
  $("#log-clear").click(function() {
    return logClear();
  });
  $("#log-reload").click(function() {
    return location.reload();
  });
  window.LogAdd = logAdd;
  Log = [];
  LogList = $("#log-list");
  if (!window.localStorage) return;
  logJson = localStorage.getItem("Log");
  logJson = logJson || "[]";
  Log = JSON.parse(logJson);
  for (_i = 0, _len = Log.length; _i < _len; _i++) {
    entry = Log[_i];
    LogList.append("<li>" + entry);
  }
  return LogList.listview('refresh');
};

logAdd = function(message) {
  var entry1, entry2;
  if (!window.LogAdd) return;
  entry1 = "" + (new Date()) + ":";
  entry2 = "" + message;
  Log.unshift(entry2);
  Log.unshift(entry1);
  LogList.prepend("<li>" + entry2);
  LogList.prepend("<li>" + entry1);
  LogList.listview('refresh');
  if (!window.localStorage) return;
  return localStorage.setItem("Log", JSON.stringify(Log, null, 2));
};

logClear = function() {
  if (!window.LogAdd) return;
  Log = [];
  LogList.html("");
  if (!window.localStorage) return;
  return localStorage.setItem("Log", "[]");
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
