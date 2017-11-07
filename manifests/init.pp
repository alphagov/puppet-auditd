# == Class: auditd
#
# Sets up auditd with a set of rules.
#
class auditd (
  $immutable                     = true,
  $halt_machine_on_audit_failure = false,
) {

  anchor { 'auditd::begin': }
  -> class { 'auditd::package': }
  -> class { 'auditd::config':
    immutable => $immutable,
    halt      => $halt_machine_on_audit_failure,
  }
  class { 'auditd::service': }
  -> anchor { 'auditd::end': }

  Anchor['auditd::begin']  ~> Class['auditd::service']
  Class['auditd::package'] ~> Class['auditd::service']
  Class['auditd::config']  ~> Class['auditd::service']
}
