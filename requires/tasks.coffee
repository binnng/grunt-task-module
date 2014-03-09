taskPath = "#{__dirname}/../tasks/"

tasks = (grunt) ->
	tasks = taskFiles = []
	grunt.file.recurse taskPath, (abspath, rootdir, subdir, filename) ->
		taskFiles.push filename

	taskFiles = grunt.file.match [
		"*.coffee"
		"*.js"
	], taskFiles

	tasks = taskFiles.map (task) ->
		task.replace /\.js|\.coffee$/, '' if tasks.indexOf task < 0

	tasks

module.exports = tasks
