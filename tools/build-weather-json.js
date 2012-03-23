#!/usr/bin/env node

console.log("building weather.json")

var fs   = require('fs')
var path = require('path')

var dir = path.join(__dirname, '..', 'weather')

var entries = fs.readdirSync(dir)

var object = {}
for (var i=0; i<entries.length; i++) {
    var entry = entries[i]
    if (!entry.match('\.html$')) continue
    
    var contents = fs.readFileSync(path.join(dir, entry), 'utf8')
    
    contents = contents.replace(/<a.*?>(.|\s)*?<\/a>/g,'')
    
    object[entry] = contents
}

var oFile    = path.join(dir, 'weather.json')
var contents = JSON.stringify(object, null, 4)

fs.writeFileSync(oFile, contents, 'utf8')