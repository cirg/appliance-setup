# Class: appliance_components::postgresql
#
# Requires: nothing
#
class appliance_components::postgresql {
  include ::locales
  include ::postgresql::server

  # Set up locales before installing postgresql
  Class['::locales'] -> Class['::postgresql::server']

  # Recreate databases using UTF-8 locale
  exec { 'utf8 postgres':
    command => '/usr/bin/pg_dropcluster --stop 8.4 main ; /usr/bin/pg_createcluster --start --locale en_US.UTF-8 8.4 main',
    unless  => '/bin/su postgres -c \'psql -t -c \\\l\' | grep template0 | grep -q UTF',
    require => Package['postgresql-server'],
  }

  # Additional packages to install

  $packagelist = [
    'postgresql-contrib-8.4',
  ]

  package { $packagelist:
    ensure => installed,
  }
}
