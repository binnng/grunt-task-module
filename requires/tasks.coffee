fs = require 'fs'

taskPath = "#{__dirname}/../tasks/"
taskFiles = (fs.readdirSync taskPath).filter (file) -> return yes if file.match /\.coffee$/
taskFiles = taskFiles.map (file) -> return "#{file.replace '.coffee', ''}"

module.exports = taskFiles
