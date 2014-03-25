% my ($menu, $posts) = @_;
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Poznań Perl Mongers Group :: poznan.pm.org</title>
        <link type="text/css" rel="stylesheet" href="css/style.css">
        <!--[if lt IE 9]>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    </head>
    <body>
        <div id="all">
            <div id="logo">
                <a href="/"><img src="img/perl_logo.gif"></a> POZNAN.PM.ORG
            </div>
            <div id="content">
                <div id="l">
% for $menu.list -> $m {

                <a href="<%= $m.location %>"><%= $m.title %></a><br>

% }
                </div>
                <div id="r">
                <%= $posts %>
                </div>
            </div>
            <div id="stopka">2013-2014 &copy; poznan.pm.org | <a href="https://github.com/poznan-pm/poznan.pm.org">source</a> | genereted using <a href="https://github.com/sergot/BreakDancer">BreakDancer</a></div>
        </div>
    </body>
</html>
