var loadWeather, onLoad, setupMaps;

$(document).ready(function() {
  return onLoad();
});

onLoad = function() {
  loadWeather();
  return setupMaps();
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
