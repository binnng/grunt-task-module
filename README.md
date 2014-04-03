grunt-task-module
=================

**一种模块化书写Grunt任务的方式**


`Gruntfile.js`里一长串的配置，随着任务越来越多，配置会越来越长，越来越乱。

把Grunt里每个任务**按项目**都做了拆分，作为模块放进了`tasks`文件夹。

###说明

`Gruntfile.coffee`（或Gruntfile.js）主要做了四件事情：

1. 加载`tasks`处理模块，后面具体介绍这个js

  ```
  tasks = (require './requires/tasks') grunt
  ```
  
2. 加载`path`路径配置
  
  ```
  path = (require './requires/path') grunt
  ```
  
3. 「合成」`tasks`里每个项目任务
  
  ```
  for task in tasks
    config = extend yes, config or {}, (require "./tasks/#{task}") grunt
  ```

4. 将合成的`config`对象传给`grunt.initConfig`

  ```
  grunt.initConfig config
  ```
  
###tasks

每一个`task`格式大致这样：

```
exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  grunt.registerTask 'bugoo', 'uglify:bugoo'

  path = grunt.config.get "path"

  uglify:
    bugoo:
      src: "#{path.jsdev}bugoo.js"
      dest: "#{path.jslib}min.bugoo.js"

module.exports = exports
```

1. 加载grunt依赖任务处理模块

```
grunt.loadNpmTasks 'grunt-contrib-uglify'
```

2. 注册grunt任务

```
grunt.registerTask 'bugoo', 'uglify:bugoo'
```

3. 导出任务配置对象：

```
{
  uglify: {
    bugoo: {
      src: path.jsdev + "bugoo.js"
      dest: path.jslib + "min.bugoo.js"
    }
  }
}
```

具体可以看看这篇博客[我是如何将冗长的Grunt任务拆分的](http://blog.segmentfault.com/laopopo/1190000000442112)
