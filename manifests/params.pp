class ntpd::params {
  $config = '/etc/ntpd.conf'
  $user = 'root'
  $mode = '0644'
  $service = 'ntpd'

  case $::osfamily {
    'OpenBSD': {
      $group = 'wheel'
    }
    default: {
      fail('Class[ntpd]: your operating system is not supported: $::operatingsystem')
    }
  }
}
