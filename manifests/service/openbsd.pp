class ntpd::service::openbsd {
  include ntpd::params

  ini_setting { 'ntpd_flags':
    ensure            => present,
    path              => '/etc/rc.conf.local',
    section           => '',
    setting           => 'ntpd_flags',
#    value             => $ntpd::params::ntpd_flags_value,
    value             => '"-v"',
    key_val_separator => '=',
  }
}



