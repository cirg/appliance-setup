class mysql {
  $packagelist = ['mysql-server-5.1']

  package { $packagelist:
    ensure => installed,
  }
}
