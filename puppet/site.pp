node default {
  class { 'apache': }
  class { 'apache::mod::ssl': }

  file { '/etc/apache2/sites-enabled/default-ssl':
    ensure  => link,
    target  => '/etc/apache2/sites-available/default-ssl',
    require => [
      Package['httpd'],
      Package['ssl-cert'],
    ],
    notify  => Service['httpd'],
  }

  package { 'ssl-cert':
    ensure => installed,
  }

  class { 'java': }
  class { 'mysql::server':
    config_hash => { 'root_password' => 'UP9aeKas' }
  }
  class { 'tomcat': }

  # Additional packages to install

  $packagelist = [
    'firefox',
  ]

  package { $packagelist:
    ensure => installed,
  }
}
