class tomcat {
  $packagelist = ['tomcat6']

  package { $packagelist:
    ensure => installed,
  }
}
