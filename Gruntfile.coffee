extend = require 'extend'

tasks = require './requires/tasks'
path = require './requires/path'

exports = (grunt) ->

  gruntPackage = grunt.file.readJSON 'package.json'

  for task in tasks
    config = extend yes, config or {}, (require "./tasks/#{task}")(grunt, path, gruntPackage)

  grunt.config.init config
  grunt.registerTask 'default', tasks

module.exports = exports