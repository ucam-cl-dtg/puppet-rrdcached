class rrdcached::params {
  $ensure = 'present'
  $auto_upgrade = false
  $service_ensure = 'running'
  $service_enable = true

  $socket_file  = '/var/run/rrdcached.sock'
  $gid     = 'root'
  $journal_dir = '/var/lib/rrdcached/journal/'
  $mode    = '0660'
  $timeout = '1800'
  $delay   = '1800'
  $write_threads = '4'
  $jump_dir = '/var/lib/rrdcached/db/'
  $always_flush = true
  $enable_corefiles = false
  $maxwait = '30'
  $restrict_writes = false
  $user = undef
  $group = undef

  case $::operatingsystem {
    'Debian', 'Ubuntu': {
      $package = [ 'rrdcached' ]
      $config = '/etc/default/rrdcached'
      $service_name = 'rrdcached'
    }
    default: {
      fail("\"${module_name}\" is not supported on \"${::operatingsystem}\"")
    }
  }

}
