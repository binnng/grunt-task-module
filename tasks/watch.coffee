module.exports = (grunt, path, pkg) ->
  grunt.loadNpmTasks 'grunt-contrib-watch'

  tasksPath = "#{__dirname}/../tasks/"
  requiresPath = "#{__dirname}/../requires/"

  config = 
    watch:
      files: [
        "#{path.jsdev}*.coffee"
        "#{tasksPath}*.coffee"
        "#{requiresPath}*.coffee"
        "#{path.cssdev}*.less"
      ]
      tasks: "default"

  config