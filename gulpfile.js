var gulp         = require('gulp')
   ,sass         = require('gulp-sass')
   ,rename       = require('gulp-rename')
   ,cssmin       = require('gulp-cssmin')
   ,postcss      = require('gulp-postcss')
   ,autoprefixer = require('autoprefixer');

var postCSSProcessors = [autoprefixer({browsers: ['last 11 version']})];

function compileCSS(type) {
    if (type === 'dev') {
        return gulp.src('assets/sass/main.scss')
            .pipe(sass().on('error', sass.logError))
            .pipe(postcss(postCSSProcessors))
            .pipe(rename('main.dev.css'))
            .pipe(gulp.dest('static/css'));
    } else {
        return gulp.src('assets/sass/main.scss')
            .pipe(sass().on('error', sass.logError))
            .pipe(postcss(postCSSProcessors))
            .pipe(cssmin())
            .pipe(rename('main.css'))
            .pipe(gulp.dest('static/css'));
    }
}

gulp.task('compile_css-dev', function() { return compileCSS('dev') });
gulp.task('compile_css-pro', function() { return compileCSS('pro') });
gulp.task('watchSASS', function() {
    gulp.watch('assets/sass/**/*.scss', ['compile_css-dev'
                                        ,'compile_css-pro']);
});

gulp.task('default', ['watchSASS']);
