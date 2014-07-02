class ntpd::params {
  $config = '/etc/ntpd.conf'
  $user = 'root'
  $mode = '0644'
  $service = 'ntpd'
  $ntpd_flags_value = '"-v"'

  case $::osfamily {
    'OpenBSD': {
      $group = 'wheel'
    }
    default: {
      fail('Class[ntpd]: your operating system is not supported: $::operatingsystem')
    }
  }
}
