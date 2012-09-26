# Class: appliance_components::java
#
# Requires: nothing
#
class appliance_components::java {
  include ::java

  package { 'maven2':
    ensure => installed,
  }
}
