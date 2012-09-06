# Class: appliance_components::openelis
#
# Requires: nothing
#
class appliance_components::openelis {
  include appliance_components::apache
  include appliance_components::postgresql
  include appliance_components::tomcat
}
