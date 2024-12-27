const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel applications. By default, we are compiling the CSS
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/js/kiemtratoken.js', 'public/js')
   .js('resources/js/dangxuat.js', 'public/js') // Thêm file dangxuat.js để biên dịch
   .js('resources/js/xulidangnhap.js', 'public/js')
    .postCss('resources/css/formgd.css', 'public/css', [
        //
    ])
    .postCss('resources/css/trangsp.css', 'public/css', [
        // Thêm plugin PostCSS nếu cần
    ]);
