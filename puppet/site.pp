if ! $::osfamily {
  case $::operatingsystem {
    'RedHat', 'Fedora', 'CentOS', 'Scientific', 'SLC', 'Ascendos', 'CloudLinux', 'PSBM', 'OracleLinux', 'OVS', 'OEL': {
      $osfamily = 'RedHat'
    }
    'ubuntu', 'debian': {
      $osfamily = 'Debian'
    }
    'SLES', 'SLED', 'OpenSuSE', 'SuSE': {
      $osfamily = 'Suse'
    }
    'Solaris', 'Nexenta': {
      $osfamily = 'Solaris'
    }
    default: {
      $osfamily = $::operatingsystem
    }
  }
}

node default {
  class { 'apt::backports': }

  apt::source { "ubuntu-partner":
    location    => "http://archive.canonical.com/",
    release     => "lucid",
    repos       => "partner",
    include_src => true
  }

  class { 'apache': }
  class { 'mysql::server': }
  class { 'tomcat': }
}
