

use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'Yxes::Memcached',
    VERSION_FROM => 'lib/Yxes/Memcached.pm', # finds \$VERSION
    AUTHOR       => 'Stephen D. Wells (yxes@cpan.org)',
    ABSTRACT     => 'Cache::Memcached::Fast wrapper',
    PREREQ_PM    => {
		     'Cache::Memcached::Fast' => 0.23,
                     'Test::Simple' => 1.001014,
                    },
);
