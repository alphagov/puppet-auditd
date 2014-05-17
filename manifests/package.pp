# == Class: auditd::package
#
#  This class shouldn't be called directly
#
class auditd::package {
  package { 'auditd':
    ensure => installed
  }

  $pkgname = $::lsbdistcodename ? {
    /^lucid$|^precise$/ => 'libaudit0',
    'trusty'            => 'libaudit1',
    default             => 'libaudit1',
  }
  package { $pkgname:
    ensure => installed
  }
  package { 'audispd-plugins':
    ensure => installed
  }
}
