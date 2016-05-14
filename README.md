# Yxes::Memcached

## INSTALLATION
to install the module...

```bash

perl Makefile.PL
make
make test
make install
```

If you are on a windows box you should use *'nmake'* rather than *'make'*.

## DOCUMENTATION

### NAME

Yxes::Memcached - Cache::Memcached::Fast wrapper

### VERSION

0.04

### SYNOPSIS



**use the defaults**

```perl
      use Yxes::Memcached;
  
      my $mem = Yxes::Memcached->new;

         $mem->set('MYVAR' => 'myval');
      my $var = $mem->get('MYVAR');
```

or use this as you would [Cache::Memcached::Fast](http://search.cpan.org/~kroki/Cache-Memcached-Fast-0.23/lib/Cache/Memcached/Fast.pm)

```perl

      use Yxes::Memcached;

      my $mem = Yxes::Memached->new({
                    servers => [ { address => 'localhost:11211', weight => 2.5 },
                                 '192.168.254.2:11211' }],
                    namespace => 'my:',
                    connect_timeout => 0.2,
                    ...
       });
```

### DESCRIPTION

This package is just a wrapper around 
[Cache::Memcached::Fast](http://search.cpan.org/~kroki/Cache-Memcached-Fast-0.23/lib/Cache/Memcached/Fast.pm)
and is used to give us a default location for a memcached server. We do
this by simply setting the default server to *'memcached'* at the default
port *'11211'*. It's your job to be sure that *'memcached'* is set in the
hosts file to point to a real IP number. The idea is to make it very easy to
move the memcached server to a new location and just update the *'hosts'*
file without having to find all the scripts on your machine that use
your server.

#### new

Use the same way you would [Cache::Memcached::Fast](http://search.cpan.org/~kroki/Cache-Memcached-Fast-0.23/lib/Cache/Memcached/Fast.pm)

Optional Attributes:

- `servers => [ { address => 'host:port', weight => #.## }, 'host:port' }]`
- `namespace => 'name:'`
- `connect_timeout => #.# `

the default server is added as *'memcached:11211'* and can be set in your
*/etc/hosts* file

### EXAMPLES

#### HOSTS

in your */etc/hosts* file

* assuming your memcache server runs on your local machine **`127.0.0.1 localhost memcached`**
* otherwise the IP it does run on **`192.168.12.34 memcached`**

#### PROGRAM

We want to use the default server [*`memcached:11211`*] in this case:

```perl
         use Yxes::Memcached;

         my $mem = Yxes::Memcached->new();
```

You can of course add any attributes that are accepted by
*Cache::Memcached::Fast* as part of your new call and leave out the
servers portion.

```perl

         use Yxes::Memcached;

         my $mem = Yxes::Memcached->new({
                        namespace => 'my:',
                        close_on_error => 1,
                        max_failures => 3
                   });
```

As part of testing you may want to point to a different server
entirely...

```perl

         use Yxes::Memcached;

         my $mem = Yxes::Memcached->new({
                        servers => [ { address => '/path/to/unix.sock', noreply => 1 } ]
                   });
```

### TODO

This doesn't address using multiple servers with your memcached server.
To do that I would recommend having your scripts read from a universal
configuration file.

### BUGS

This sucks if you want to access a socket file instead of an IP and
port.

### SUPPORT

none, nada, zilch... good luck

### AUTHOR

    Stephen D. Wells
    CPAN ID: YXES
    yxes@cpan.org
    
GitHub: [yxes/Yxes-Memcached](https://github.com/yxes/Yxes-Memcached)

### COPYRIGHT

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

The full text of the license can be found in the LICENSE file included
with this module.

### SEE ALSO

[Cache::Memcached::Fast](http://search.cpan.org/~kroki/Cache-Memcached-Fast-0.23/lib/Cache/Memcached/Fast.pm)

