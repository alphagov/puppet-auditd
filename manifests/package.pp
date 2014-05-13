# == Class: auditd::package
#
#  This class shouldn't be called directly
#
class auditd::package {
  package { 'auditd':
    ensure => installed
  }

  $pkgname = $lsbdistrelease ? {
    '12.04' => 'libaudit0',
    default => 'libaudit1',
  }
  package { "$pkgname":
    ensure => installed
  }
  package { 'audispd-plugins':
    ensure => installed
  }
}
