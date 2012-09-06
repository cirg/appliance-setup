# Class: appliance_components::apache
#
# This class installs and configures Apache. SSL is configured with a
# self-signed certificate. All traffic is redirected to HTTPS.
#
# Requires: nothing
#
class appliance_components::apache {
  include ::apache
  include ::apache::mod::ssl
  include ::apache::mod::proxy
  include ::apache::mod::proxy_http
  apache::mod { 'rewrite': }

  file { '/etc/apache2/sites-enabled/default-ssl':
    ensure  => link,
    target  => '/etc/apache2/sites-available/default-ssl',
    require => [
      Package['httpd'],
      Package['ssl-cert'],
    ],
    notify  => Service['httpd'],
  }

  file { '/etc/apache2/conf.d/redirect-ssl.conf':
    ensure  => present,
    source  => 'puppet:///modules/appliance_components/redirect-ssl.conf',
    require => [
      Package['httpd'],
    ],
    notify  => Service['httpd'],
  }

  package { 'ssl-cert':
    ensure => installed,
  }
}
