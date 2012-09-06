# Class: appliance_components::postgresql
#
# Requires: nothing
#
class appliance_components::postgresql {
  include ::postgresql::server
}
