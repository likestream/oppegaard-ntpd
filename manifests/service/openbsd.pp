class ntpd::service::openbsd {
  include ntpd::params

  rcconf { 'ntpd_flags':
    value => $ntpd::params::ntpd_flags,
    before => Class['ntpd::service'],
  }
}
