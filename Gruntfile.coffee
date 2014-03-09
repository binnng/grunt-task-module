extend = require 'extend'

exports = (grunt) ->

  tasks = (require './requires/tasks') grunt
  path = (require './requires/path') grunt

  grunt.config.set "pkg", grunt.file.readJSON 'package.json'

  for task in tasks
    config = extend yes, config or {}, (require "./tasks/#{task}") grunt

  grunt.initConfig config
  grunt.registerTask 'default', tasks

module.exports = exports