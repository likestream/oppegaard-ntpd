class ntpd::package {
  include ntpd::params

  if $ntpd::params::package {
    package { $ntpd::params::package:
      ensure => installed,
    }
  }
}
