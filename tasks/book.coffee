module.exports = (grunt) ->

  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-coffee');

  path = grunt.config.get "path"

  grunt.registerTask 'book:css', [
  	'less:book'
  	'cssmin:book'
  ]

  grunt.registerTask 'book:js', [
  	'coffee:book'
  	'uglify:book'
  	'concat:book'
  ]

  grunt.registerTask 'book', [
  	'book:css'
  	'book:js'
  ]

  coffee:
  	book:
  		src: "#{path.jsdev}book.coffee"
  		dest: "#{path.tmp}book.coffee.js"

  less:
  	book:
  		src: "#{path.cssdev}book.less"
  		dest: "#{path.tmp}book.less.css"

  uglify:
  	book:
  		src: "<%= coffee.book.dest %>"
  		dest: "#{path.tmp}book.coffee.uglify.js"

  concat:
  	book:
  		src: [
  			"#{path.jslib}jquery.min.js"
  			"<%= uglify.book.dest %>"
  		]
  		dest: "#{path.jsmin}min.book.js"

  cssmin:
  	book:
  	  src: "<%= less.book.dest %>"
  	  dest: "#{path.cssmin}min.book.css"
