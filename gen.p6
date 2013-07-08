use v6;

use BreakDancer;
use Template::Mojo;

class Link {
    has $.location is rw;
    has $.title is rw;
}

class Post {
    has $.title is rw;
    has $.location is rw;
    has $.content is rw;
    has $.date is rw;
}

my $path = 'www';
my $index_tmpl = slurp "tmpls/index.mojo";
my $post_tmpl  = slurp "tmpls/blog/post.mojo";


my @conts;
for get_items('sites') {
    @conts.push: slurp ~$_;
}

my %sites = get_items('sites')>>.Str>>.substr(11) Z @conts;

@conts = ();
for get_items('blog') {
    @conts.push: slurp ~$_;
}
my %posts = get_items('blog')>>.Str>>.substr(10) Z @conts;

gen '/', sub {
    my $menu = menu(get_items('sites'));
    my $posts = blog(get_items('blog'));
    $posts = Template::Mojo.new($post_tmpl).render($posts);

    return Template::Mojo.new($index_tmpl).render($menu, $posts);
}

gen '/sites', %sites,  sub ($site, $content) {
    return Template::Mojo.new($index_tmpl).render(menu(get_items('sites')), $content);
}

gen '/blog', %posts, sub ($post, $content) {
    return Template::Mojo.new($index_tmpl).render(menu(get_items('sites')), $content);
}

sub get_items(Str $location) {
    my @items = dir "data/$location";

    return @items;
}

sub split(Str $path is copy) {
    my $file = $path.substr($path.rindex('/')+1);
    $path = $path.substr($path.index('/')+1, $path.rindex('/')-5);

    return ($path, $file);
}

sub menu(@items) {
    my @ret;
    for @items -> $i {
        my ($l, $t) = split(~$i);
        @ret.push: Link.new(location => "$l/$t", title => $t);
    }

    return @ret.item;
}

sub blog(@items) {
    my @ret;
    for @items -> $i {
        my ($l, $t) = split(~$i);
        my $post = Post.new(location => "$l/$t", title => $t, date => "TODOay");
        $post.content = slurp $i;
        @ret.push: $post;
    }
    return @ret.item;
}
