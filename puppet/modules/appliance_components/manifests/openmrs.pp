class appliance_components::openmrs {
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
