var gulp   = require('gulp'),
    sass   = require('gulp-sass'),
    rename = require('gulp-rename');

gulp.task('compile-css', function() {
    gulp.src('assets/sass/main.scss')
        .pipe(sass().on('error', sass.logError))
        .pipe(rename('main.css'))
        .pipe(gulp.dest('static/css'))
});

gulp.task('watchSASS', function() {
    gulp.watch('assets/sass/**/*.scss', ['compile-css'])
});

gulp.task('default', ['watchSASS']);
