% my ($menu, $posts) = @_;
<!DOCTYPE html>
<html>
    <head>
        <title>Poznań Perl Mongers Group :: poznan.pm.org</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="/css/style.css">
    </head>
    <body>
        <div id="all">
            <div id="logo">
                <a href="/"><img src="/img/perl_logo.gif"></a> POZNAN.PM.ORG
            </div>
            <div id="content">
                <div id="l">
                <a href="/">Strona Główna</a><br>
% for $menu.list -> $m {

                <a href="/<%= $m.location %>"><%= $m.title %></a><br>

% }
                </div>
                <div id="r">
                <%= $posts %>
                </div>
            </div>
            <div id="stopka">2013 &copy; poznan.pm.org | <a href="https://github.com/sergot/poznan.pm.org">source</a> | genereted using <a href="https://github.com/sergot/BreakDancer">BreakDancer</a></div>
        </div>
    </body>
</html>
