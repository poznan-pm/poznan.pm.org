% my $posts = @_[0];
% for $posts.list -> $p {
<div id="post">
    <div id="title">
        <div class="postdate"><%= $p.date %></div><div class="posttitle"><a href="/<%= $p.location %>"><%= $p.title %></a></div>
    </div>
    <p class="postcontent">
        <%= $p.content %>
    </p>
</div>

% }
