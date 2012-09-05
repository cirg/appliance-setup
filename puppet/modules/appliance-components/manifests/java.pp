class appliance-components::java {
  include ::java

  $packagelist = [
    'maven2',
  ]

  package { $packagelist:
    ensure => installed,
  }
}
