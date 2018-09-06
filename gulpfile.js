var gulp = require('gulp');
var async = require('async');
var iconfont = require('gulp-iconfont');
var consolidate = require('gulp-consolidate');
var rename = require('gulp-rename');

var runTimestamp = Math.round(Date.now()/1000);

gulp.task('Iconfont', function(done){
    var iconStream = gulp.src(['icons/*.svg'])
        .pipe(iconfont({
            fontName: 'myfont', // required
            formats: ['svg', 'ttf', 'eot', 'woff', 'woff2'],
            prependUnicode: true, // recommended option
            timestamp: runTimestamp, // recommended to get consistent builds when watching files
        }));

    async.parallel([
        function handleGlyphs (cb) {
            iconStream.on('glyphs', function(glyphs, options) {
                gulp.src('templates/icon.tpl')
                    .pipe(consolidate('lodash', {
                        glyphs: glyphs,
                        fontName: 'myfont',
                        fontPath: '../fonts/',
                        className: 's',
                        timestamp: runTimestamp
                    }))
                    .pipe(rename('icon.css'))
                    .pipe(gulp.dest('www/css/'))
                    .on('finish', cb);
            });
        },
        function handlePreview (cb) {
            iconStream.on('glyphs', function(glyphs, options) {
            gulp.src('templates/preview.tpl')
                .pipe(consolidate('lodash', {
                    glyphs: glyphs,
                    className: 's',
                }))
                .pipe(rename('index.html'))
                .pipe(gulp.dest('www/'))
                .on('finish', cb);
        });
},
        function handleFonts (cb) {
            iconStream
                .pipe(gulp.dest('www/fonts/'))
                .on('finish', cb);
        }
    ], done);
});

gulp.task('default', ['Iconfont']);

