class appliance-components::mysql {
  class { '::mysql::server':
    config_hash => { 'root_password' => hiera('mysql_root_password') }
  }
}
