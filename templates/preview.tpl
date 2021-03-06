<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Icons</title>
    <link href="css/icon.css" rel="stylesheet">
    <style>
        .crew {
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
        }

        .card {
            display: flex;
            flex-direction: column;
            align-items: center;
            flex: 10%;
            margin: 8px 16px;
            padding: 20px 0;
        }

        .card:hover {
            background-color: #1890ff;
            color: #fff;
        }

        .card:hover i {
            transform: scale(1.25);
        }

        .card, .card i {
            transition: all 0.2s;
        }

        .card:hover, .card:hover i {
            transition: all 0.2s ease-in-out;
        }

        .card span {
            margin-top: 2px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="crew">
    <% _.each(glyphs, function(glyph) { %>
        <div class="card">
            <i class="<%= className %> <%= className %>-<%= glyph.name %> <%= className %>-2x"></i>
            <span><%= className %>-<%= glyph.name %></span>
        </div>
    <% }) %>
    </div>
</body>
</html>