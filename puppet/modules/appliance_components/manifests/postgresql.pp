# Class: appliance_components::postgresql
#
# Requires: nothing
#
class appliance_components::postgresql {
  include ::locales
  include ::postgresql::server

  # Set up locales before installing postgresql
  Class['::locales'] -> Class['::postgresql::server']

  # Additional packages to install

  $packagelist = [
    'postgresql-contrib-8.4',
  ]

  package { $packagelist:
    ensure => installed,
  }
}
