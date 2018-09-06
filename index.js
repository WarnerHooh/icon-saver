const fs = require('fs');
const cheerio = require('cheerio');

fs.readFile('icons_filled.txt', {encoding: 'utf-8'}, (error, data) => {
    makeIcons(data);
});

fs.readFile('icons_outline.txt', {encoding: 'utf-8'}, (error, data) => {
    makeIcons(data, '-o');
});

function makeIcons(data, suffix = '') {
    const $ = cheerio.load(data);
    const $icons = $('i.anticon');

    $icons.each((i, anticon) => {
        const $anticon = $(anticon);
        const icon = $anticon.find('svg').data('icon');
        const html = $anticon.html();

        const replaced = html.replace('width="1em" height="1em"', 'width="1024" height="1024"');

        fs.writeFileSync(`icons/${icon}${suffix}.svg`, replaced, {encoding: 'utf-8'})
    });

    console.log(`${$icons.length} icons generated`);
}