
bar = require './foo/bar.js'

exports.main =  ->
  log = document.getElementById 'log'
  for message, i in bar.messages
    log.innerHTML += "#{ i } - #{ message }\n"
