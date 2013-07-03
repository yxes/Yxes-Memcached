# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 2;

BEGIN { use_ok( 'Yxes::Memcached' ); }

my $object = Yxes::Memcached->new ();
isa_ok ($object, 'Yxes::Memcached');
