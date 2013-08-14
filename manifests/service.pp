# == Class: auditd::service
#
#  This class shouldn't be called directly
#
class auditd::service {
  service { 'auditd':
    ensure  => running,
  }
}
