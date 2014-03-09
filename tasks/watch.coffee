module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-watch'

  tasksPath = "#{__dirname}/../tasks/"
  requiresPath = "#{__dirname}/../requires/"

  path = grunt.config.get "path"

  watch:
    files: [
      "#{path.jsdev}*.coffee"
      "#{tasksPath}*.coffee"
      "#{requiresPath}*.coffee"
      "#{path.cssdev}*.less"
    ]
    tasks: "default"