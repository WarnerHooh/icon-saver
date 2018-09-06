@font-face {
  font-family: "<%= fontName %>";
  src: url('<%= fontPath %><%= fontName %>.eot?t=<%= timestamp %>');
  src: url('<%= fontPath %><%= fontName %>.eot?#iefix&t=<%= timestamp %>') format('eot'),
    url('<%= fontPath %><%= fontName %>.woff2?t=<%= timestamp %>') format('woff2'),
    url('<%= fontPath %><%= fontName %>.woff?t=<%= timestamp %>') format('woff'),
    url('<%= fontPath %><%= fontName %>.ttf?t=<%= timestamp %>') format('truetype'),
    url('<%= fontPath %><%= fontName %>.svg?t=<%= timestamp %>#<%= fontName %>') format('svg');
  font-weight: normal;
  font-style: normal;
}

.<%= className %>:before {
  display: inline-block;
  font-family: "<%= fontName %>";
  font-style: normal;
  font-weight: normal;
  line-height: 1;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.<%= className %>-lg {
  font-size: 1.3333333333333333em;
  line-height: 0.75em;
  vertical-align: -15%;
}
.<%= className %>-2x { font-size: 2em; }
.<%= className %>-3x { font-size: 3em; }
.<%= className %>-4x { font-size: 4em; }
.<%= className %>-5x { font-size: 5em; }
.<%= className %>-fw {
  width: 1.2857142857142858em;
  text-align: center;
}

<% _.each(glyphs, function(glyph) { %>.<%= className %>-<%= glyph.name %>:before { content: "\<%= glyph.unicode[0].charCodeAt(0).toString(16).toUpperCase() %>" }
<% }); %>