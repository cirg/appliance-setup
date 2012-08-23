class appliance-components::mysql {
  class { '::mysql::server':
    config_hash => { 'root_password' => 'UP9aeKas' }
  }
}
