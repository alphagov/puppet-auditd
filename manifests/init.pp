# == Class: auditd
#
# Sets up auditd with a set of rules.
#
class auditd {

  anchor { 'auditd::begin': } ->
  class { 'auditd::package': } ->
  class { 'auditd::config': }
  class { 'auditd::service': } ->
  anchor { 'auditd::end': }

  Anchor['auditd::begin']  ~> Class['auditd::service']
  Class['auditd::package'] ~> Class['auditd::service']
  Class['auditd::config']  ~> Class['auditd::service']
}
