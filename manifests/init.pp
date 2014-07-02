# == Class: ntpd
#
# Manages OpenNTPD - service and configuration.
#
# === Parameters
#
# [*settings*]
#   Array containing the lines that will go into ntpd.conf.
#   Each element is a literal line in the config file.
#
# === Examples
#
#  # ntpd server
#  class { 'ntpd':
#    settings => [
#      "listen on 10.1.0.3",
#      "servers europe.pool.ntp.org",
#    ],
#  }
#
#  # ntpd client
#  class { 'ntpd':
#    settings => [
#      "server ntp.my.domain",
#    ],
#  }
#
class ntpd (
  $settings,
) {
  validate_array($settings)

  include ntpd::params
  include ntpd::package
  include ntpd::service

  file { $ntpd::params::config:
    owner => $ntpd::params::user,
    group => $ntpd::params::group,
    mode => $ntpd::params::mode,
    content => template('ntpd/ntpd.conf.erb'),
    notify => Class['ntpd::service'],
  }
}
