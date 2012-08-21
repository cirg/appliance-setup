node default {
  class { 'apache': }
  class { 'mysql::server': }
  class { 'tomcat': }
}
