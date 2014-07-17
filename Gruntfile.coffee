module.exports = (grunt) ->

  # project configuration
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    # Observe file modifications
    watch:
      gruntfile:
        files: ['Gruntfile.coffee']
        tasks: ['coffeelint:gruntfile']

      sources:
        files: ['lib/*.coffee']
        tasks: ['test']

      test:
        files: ['test/*.coffee']
        tasks: ['test']

    # Check for syntax
    coffeelint:
      gruntfile: ['Gruntfile.coffee']
      sources: ['lib/*.coffee']
      tests: ['test/*.coffee']
      options:
        configFile: 'coffeelint.json'

    # Run Mocha tests
    mochaTest:
      options:
        reporter: 'spec'
        require: 'coffee-script/register'
      test:
        src: ['test/*.coffee']

  # load plugins
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-mocha-test'

  # default task
  grunt.registerTask 'default', [
    'watch'
  ]

  # test, after lint and compile
  grunt.registerTask 'test', [
    'coffeelint:sources', 'coffeelint:tests'
    'mochaTest:test'
  ]
