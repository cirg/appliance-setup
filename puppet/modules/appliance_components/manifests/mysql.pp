# Class: appliance_components::mysql
#
# Requires: nothing
#
class appliance_components::mysql {
  class { '::mysql::server':
    config_hash => { 'root_password' => hiera('mysql_root_password') }
  }

  # The mysql module database* providers fail to use the root
  # credentials from /root/.my.cnf. Creating /etc/my.cnf fixes this
  # until the issue can be resolved.
  file { '/etc/my.cnf':
    ensure => link,
    target => '/root/.my.cnf',
  }
}
