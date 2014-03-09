exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  grunt.registerTask 'bugoo', 'uglify:bugoo'

  path = grunt.config.get "path"

  coffee:
    bugoo:
      src: "#{path.tmp}bugoo.coffee"
      dest: "#{path.tmp}bugoo.coffee.js"

  uglify:
    bugoo:
      src: "#{path.jsdev}bugoo.js"
      dest: "#{path.jslib}min.bugoo.js"

module.exports = exports