gulp    = require "gulp"
gutil   = require "gulp-util"
coffee  = require "gulp-coffee"
del     = require "del"
path    = require "path"
{spawn} = require "child_process"

prefix      = gutil.env.prefix || "./build"
resourceDir = path.join prefix, "Resources"

gulp.task "clean", (done) ->
  del(prefix, done)

gulp.task "js", ->
  gulp.src("./Resources/**/*.js")
    .pipe(gulp.dest(resourceDir))

gulp.task "coffee", ->
  gulp.src("./Resources/**/*.coffee")
    .pipe(coffee(bare: true))
    .pipe(gulp.dest(resourceDir))

gulp.task "resources", ->
  gulp.src(["./Resources/**/*", "!./Resources/**/*.js", "!./Resources/**/*.coffee"])
    .pipe(gulp.dest(resourceDir))

gulp.task "tiapp", ->
  gulp.src("./tiapp.xml")
    .pipe(gulp.dest(prefix))

gulp.task "precompile", ["js", "coffee", "resources", "tiapp"]

gulp.task "build", ["precompile"], (done) ->
  spawn(
    "./node_modules/.bin/titanium"
    ["build", "--project-dir", prefix].concat(process.argv)
    cwd:   "./"
    stdio: "inherit"
  )
  .on("close", done)

gulp.task "default", ["build"]
