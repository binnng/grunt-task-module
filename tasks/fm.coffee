exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-closure-compiler'

  grunt.registerTask 'fm:uglify', ['coffee:fm', 'concat:fm', 'uglify:fm']
  grunt.registerTask 'fm', ['coffee:fm', 'concat:fm', 'closure-compiler:fm']
  grunt.registerTask 'fm:concat', ['coffee:fm', 'concat:fm3']

  path = grunt.config.get "path"

  coffee:
    fm:
      src: "#{path.jsdev}fm.coffee"
      dest: "#{path.tmp}fm.coffee.js"

  concat:
    fm: 
      src: [
        "#{path.jsdev}bugoo.js"
        "<%= coffee.fm.dest %>"
      ]
      dest: "#{path.tmp}concat.fm.js"

    fm3:
      src: [
        "#{path.jsdev}bugoo.js"
        "#{path.tmp}fm.coffee.js"
      ]
      dest: "#{path.jsmin}min.fm.js"

  uglify:
    fm:
      src: "<%= concat.fm.dest %>"
      dest: "#{path.jsmin}min.fm.js"

  'closure-compiler':
    fm:
      closurePath: 'bin'
      js: "<%= concat.fm.dest %>"
      jsOutputFile: "#{path.jsmin}min.fm.js"
      maxBuffer: 500
      options: 
        compilation_level: 'ADVANCED_OPTIMIZATIONS'
        language_in: 'ECMASCRIPT5_STRICT'
        define: 'IS_USE_FLASH=false'
        output_wrapper: '(function(){%output%})()'



module.exports = exports