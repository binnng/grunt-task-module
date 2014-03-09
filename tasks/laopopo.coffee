exports = (grunt, path, pkg) -> 
  
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-closure-compiler');

  config = 
    pkg: pkg
    
    coffee:
      laopopo:
        src: "#{path.jsdev}common.coffee"
        dest: "#{path.tmp}common.coffee.js"

    less:
      laopopo:
        src: "#{path.cssdev}common.less"
        dest: "#{path.tmp}common.less.css"

    uglify:
      laopopo:
        src: "<%= coffee.laopopo.dest %>"
        dest: "#{path.tmp}common.uglify.js"

    concat:
      laopopo:
        src: [
          "#{path.jslib}yui-min.js"
          "<%= uglify.laopopo.dest %>"
        ]
        dest: "#{path.jsmin}min.common.js"

    cssmin:
      laopopo:
        options: 
          banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
        src: "<%= less.laopopo.dest %>"
        dest: "#{path.cssmin}min.common.css"

  grunt.registerTask 'laopopo:css', [
    'less:laopopo'
    'cssmin:laopopo'
  ]
  grunt.registerTask 'laopopo:js', [
    'coffee:laopopo'
    'uglify:laopopo'
    'concat:laopopo'
  ]
  grunt.registerTask 'laopopo', [
    'laopopo:css'
    'laopopo:js'
  ]

  config

module.exports = exports