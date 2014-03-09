pathMap = 
  jsmin: "static/js/"
  jsdev: "static/js/dev/"
  jslib: "static/js/dev/lib/"
  cssmin: "static/css/"
  cssdev: "static/css/dev/"
  tmp: "static/tmp/"


module.exports = (grunt) ->
  grunt.config.set "path", pathMap
  pathMap