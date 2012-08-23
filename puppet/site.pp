node default {
  class { 'apache': }
  class { 'apache::mod::ssl': }
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
