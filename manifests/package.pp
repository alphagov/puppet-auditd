# == Class: auditd::package
#
#  This class shouldn't be called directly
#
class auditd::package {
  package { 'auditd':
    ensure => installed
  }
  package { 'libaudit0':
    ensure => installed
  }
  package { 'audispd-plugins':
    ensure => installed
  }
}
