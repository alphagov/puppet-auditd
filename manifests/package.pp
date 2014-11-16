# == Class: auditd::package
#
#  This class shouldn't be called directly
#

class auditd::package {
  case $::osfamily {
    debian: {
      $package = 'auditd'
      $package_plugins = 'audispd-plugins'
      $package_lib = $::lsbdistcodename ? {
        /^lucid$|^precise$/ => 'libaudit0',
        'trusty'            => 'libaudit1',
        default             => 'libaudit1',
      }
    }
    redhat: {
      $package = 'audit'
      $package_plugins = 'audispd-plugins'
      $package_lib = 'audit-libs'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  package { $package:
    ensure => installed
  }

  package { $package_plugins:
    ensure => installed
  }

  package { $package_lib:
    ensure => installed
  }
}
