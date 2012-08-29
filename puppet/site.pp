node default {
  include appliance-components::apache
  include appliance-components::java
  include appliance-components::mysql
  include appliance-components::tomcat
  include appliance-components::openmrs

  # Additional packages to install

  $packagelist = [
    'iceweasel',
  ]

  package { $packagelist:
    ensure => installed,
  }
}
