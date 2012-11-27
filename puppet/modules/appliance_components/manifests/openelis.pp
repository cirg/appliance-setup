# Class: appliance_components::openelis
#
# Requires:
#
#  appliance_components::apache
#  appliance_components::postgresql
#  appliance_components::tomcat
#
class appliance_components::openelis {
  include appliance_components::apache
  include appliance_components::postgresql
  include appliance_components::tomcat

  # Additional packages to install

  $packagelist = [
    'curl',
  ]

  package { $packagelist:
    ensure => installed,
  }
}
