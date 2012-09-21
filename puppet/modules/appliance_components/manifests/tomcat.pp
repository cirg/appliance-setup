# Class: appliance_components::tomcat
#
# Requires: nothing
#
class appliance_components::tomcat {
  include appliance_components::java

  class { '::tomcat':
    disable_authentication => true,
    enable_ajp             => true,
  }
}
