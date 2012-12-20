# Class: appliance_components::kenyaemr
#
# Sets up system for KenyaEMR. This proxies all OpenMRS content through
# Apache (HTTPS). The proxy URL is https://server/openmrs.
#
# Requires:
#
#  appliance_components::apache
#  appliance_components::mysql
#  appliance_components::tomcat
#
class appliance_components::kenyaemr {
  include appliance_components::apache
  include appliance_components::mysql
  include appliance_components::tomcat

  file { '/etc/apache2/conf.d/openmrs.conf':
    ensure  => present,
    source  => 'puppet:///modules/appliance_components/openmrs.conf',
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

  include ::openmrs
  Class['::appliance_components::tomcat'] -> Class['::openmrs']
}
