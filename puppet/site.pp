node default {
  class { 'apt::backports': }

  apt::source { "ubuntu-partner":
    location    => "http://archive.canonical.com/",
    release     => "lucid",
    repos       => "partner",
    include_src => true
  }

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
