
jacker = require 'jacker'
path = require 'path'

module.exports = (wintersmith, callback) ->

  class JackerPlugin extends wintersmith.ContentPlugin
    ### commonjs packager plugin goodness ###

    constructor: (@_filename, @_base) ->

    getFilename: ->
      @_filename

    render: (locals, contents, templates, callback) ->
      jacker.package [@_filename], @_base, (error, result) ->
        if error
          callback error
        else
          callback null, new Buffer result

  JackerPlugin.fromFile = (filename, base, callback) ->
    callback null, new JackerPlugin filename, base

  wintersmith.registerContentPlugin 'scripts', '**/*.js', JackerPlugin
  callback()
