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
    console.log("   " + entry)
    
    var contents = fs.readFileSync(path.join(dir, entry), 'utf8')
    
    contents = contents.replace(/<a.*?>(.|\s)*?<\/a>/g,'')
    contents = contents.replace(/<form.*?>(.|\s)*?<\/form>/g,'')
    contents = contents.replace(/<title.*?>(.|\s)*?<\/title>/g,'')
    contents = contents.replace(/<link.*?>/g,'')
    contents = contents.replace(/<meta.*?>/g,'')
    contents = contents.replace(/<html.*?>/,'')
    contents = contents.replace(/<\/html>/,'')
    contents = contents.replace(/<head>/,'')
    contents = contents.replace(/<\/head>/,'')
    contents = contents.replace(/<body.*?>/,'')
    contents = contents.replace(/<\/body>/,'')
    
    object[entry] = contents
}

var oFile    = path.join(__dirname, '..', 'scripts', 'weather.js')
var contents = JSON.stringify(object, null, 4)

contents = "Weather = " + contents
fs.writeFileSync(oFile, contents, 'utf8')