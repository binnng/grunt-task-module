exports = (grunt, path, pkg) ->
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  config = 
    pkg: pkg
    
    coffee:
      bugoo:
        src: "#{path.tmp}bugoo.coffee"
        dest: "#{path.tmp}bugoo.coffee.js"

    uglify:
      bugoo:
        src: "#{path.jsdev}bugoo.js"
        dest: "#{path.jslib}min.bugoo.js"


  grunt.registerTask 'bugoo', 'uglify:bugoo'

  config

module.exports = exports