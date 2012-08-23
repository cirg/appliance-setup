node default {
  include appliance-components::apache

  class { 'java': }
  include appliance-components::mysql
  class { 'tomcat': }

  # Additional packages to install

  $packagelist = [
    'firefox',
  ]

  package { $packagelist:
    ensure => installed,
  }
}
