# Class: appliance_components::mysql
#
# Requires: nothing
#
class appliance_components::mysql {
  class { '::mysql::server':
    config_hash => { 'root_password' => hiera('mysql_root_password') }
  }
}
