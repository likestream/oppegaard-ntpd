class ntpd::service {
  include ntpd::params

  case $::osfamily {
    'OpenBSD': {
      include ntpd::service::openbsd
    }
    default: { }
  }

  service { $ntpd::params::service:
    ensure => running,
    enable => true,
    require => Class['ntpd::package'],
  }
}
