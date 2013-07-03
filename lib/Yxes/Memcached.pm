package Yxes::Memcached;
use strict;

our $VERSION = '0.03';

use constant DEFAULT_SERVER => 'memcached:11211';

use base 'Cache::Memcached::Fast';

sub new {
    my $class = shift;
    my @args = @_;

  # if they specifically defined servers we'll use that.
    push (@args, 'servers', [DEFAULT_SERVER]) if (!grep /servers/, @args); 
    
$class->SUPER::new({@args});
}

__END__

=head1 NAME

Yxes::Memcached - Cache::Memcached::Fast wrapper

=head1 VERSION

 0.03

=head1 SYNOPSIS

  [ use the defaults and simply use ]

  use Yxes::Memcached;
  
  my $mem = Yxes::Memcached->new;

     $mem->set('MYVAR' => 'myval');
  my $var = $mem->get('MYVAR');

  [ and/or use this as you would Cache::Memcached::Fast ]

  use Yxes::Memcached;

  my $mem = Yxes::Memached->new({
		servers => [ { address => 'localhost:11211', weight => 2.5 },
			     '192.168.254.2:11211' }],
		namespace => 'my:',
		connect_timeout => 0.2,
		...
   });

=head1 DESCRIPTION

This package is just a wrapper around Cache::Memcached::Fast and is used
to give us a default location for a memcached server.  We do this 
by simply setting the default server to 'memcached' at the default
port '11211'.  It's your job to be sure that 'memcached' is set in
the hosts file to point to a real IP number.  The idea is to make
it very easy to move the memcached server to a new location and
just update the 'hosts' file without having to find all the
scripts on your machine that use your server.

=head1 EXAMPLES

=head2 HOSTS

in your /etc/hosts file 

=over 4

=item * assuming your memcache server runs on your local machine

 127.0.0.1 localhost memcached

=item * otherwise the IP it does run on

 192.168.12.34 memcached

=back

=head2 PROGRAM

The server is the part that we want to default this case so 
canonically just state:

=over 4

 use Yxes::Memcached;

 my $mem = Yxes::Memcached->new();

=back

You can of course add any attributes that are accepted by
Cache::Memcached::Fast as part of your new call and leave
out the servers portion.

=over 4

 use Yxes::Memcached;

 my $mem = Yxes::Memcached->new({
		namespace => 'my:',
		close_on_error => 1,
		max_failures => 3
           });

=back

As part of testing you may want to point to a different
server entirely...

=over 4

 use Yxes::Memcached;

 my $mem = Yxes::Memcached->new({
		servers => [ { address => '/path/to/unix.sock', noreply => 1 } ]
	   });

=back

=head1 TODO

This doesn't address using multiple servers with your memcached server.  To do that
I would recommend having your scripts read from a universal configuration file.

=head1 BUGS

This sucks if you want to access a socket file instead of an IP 
and port.

=head1 SUPPORT

none, nada, zilch... good luck

=head1 AUTHOR

    Stephen D. Wells
    CPAN ID: YXES
    yxes@cpan.org
    http://www.github.com/yxes/Yxes-Memcached

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=head1 SEE ALSO

Cache::Memcached::Fast

=cut

1;
