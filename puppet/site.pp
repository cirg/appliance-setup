node default {
  include appliance-components::apache
  include appliance-components::java
  include appliance-components::mysql
  include appliance-components::tomcat

  # Additional packages to install

  $packagelist = [
    'firefox',
  ]

  package { $packagelist:
    ensure => installed,
  }
}
