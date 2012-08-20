class apache {
  $packagelist = ['apache2']

  package { $packagelist:
    ensure => installed,
  }
}
