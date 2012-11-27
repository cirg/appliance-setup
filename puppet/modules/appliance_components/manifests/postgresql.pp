# Class: appliance_components::postgresql
#
# Requires: nothing
#
class appliance_components::postgresql {
  include ::postgresql::server

  # Additional packages to install

  $packagelist = [
    'postgresql-contrib-8.4',
  ]

  package { $packagelist:
    ensure => installed,
  }
}
