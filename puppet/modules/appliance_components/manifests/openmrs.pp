# Class: appliance_components::openmrs
#
# Sets up system for OpenMRS. This proxies all OpenMRS content through
# Apache (HTTPS). The proxy URL is https://server/openmrs.
#
# Requires:
#
#  appliance_components::apache
#  appliance_components::mysql
#  appliance_components::tomcat
#
class appliance_components::openmrs {
  include appliance_components::apache
  include appliance_components::mysql
  include appliance_components::tomcat

  file { '/etc/apache2/conf.d/openmrs-proxy.conf':
    ensure  => present,
    source  => 'puppet:///modules/appliance_components/openmrs-proxy.conf',
    require => [
      Package['httpd'],
    ],
    notify  => Service['httpd'],
  }

  # Additional packages to install

  $packagelist = [
    'iceweasel',
  ]

  package { $packagelist:
    ensure => installed,
  }

  #include ::openmrs
}
