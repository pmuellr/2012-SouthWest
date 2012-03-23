var loadWeather, onLoad;

$(document).ready(function() {
  return onLoad();
});

onLoad = function() {
  return loadWeather();
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
