# Class: appliance_components::mysql
#
# Requires: nothing
#
class appliance_components::mysql {
  include ::mysql::server

  # The mysql module database* providers fail to use the root
  # credentials from /root/.my.cnf. Creating /etc/my.cnf fixes this
  # until the issue can be resolved.
  file { '/etc/my.cnf':
    ensure => link,
    target => '/root/.my.cnf',
  }
}
