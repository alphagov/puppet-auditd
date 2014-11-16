# == Class: auditd::package
#
#  This class shouldn't be called directly
#

class auditd::package {
  case $::osfamily {
    debian: { $package = 'auditd' }
    redhat: { $package = 'audit' }
    default: { fail("${::operatingsystem} not supported") }
  }

  package { $package:
    ensure => installed
  }

  package { 'audispd-plugins':
    ensure => installed
  }
}
